data "aws_availability_zones" "azs" {
  state = "available"
}

data "aws_key_pair" "key" {
  key_name           = var.key_pair_name
  include_public_key = true
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["bitnami-wordpress-5.8.1-22-r08-linux-debian-10-x86_64-hvm-ebs-frontend-rds-nami*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

