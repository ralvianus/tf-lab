data "aws_availability_zones" "azs" {
  state = "available"
}

data "aws_key_pair" "key" {
  key_name           = var.key_pair_name
  include_public_key = true
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

