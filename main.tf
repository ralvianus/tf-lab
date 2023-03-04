terraform {
  required_version = ">= 1.3.7"
  cloud {
    organization = "technical-exercise"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
    hostname = "app.terraform.io"

    workspaces {
      tags = ["lab", "webserver"]
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name = "${var.name_prefix}-igw"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = data.aws_availability_zones.availabe.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name_prefix}-subnet-${count.index}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id
  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_blocks)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "ssh_sg" {
  vpc_id      = aws_vpc.default.id
  name        = "ssh-sg"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.name_prefix}-sg"
  }
}

resource "aws_instance" "web_server" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  # the VPC subnet
  subnet_id = aws_subnet.public.id

  # the security group
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  # the public SSH key
  key_name = aws_key_pair.key.key_name

  tags = {
    Name = "${var.name_prefix}-web-${count.index}"
  }
}

output "ip" {
  value = aws_instance.example.public_ip
}