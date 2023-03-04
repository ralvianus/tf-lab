data "aws_availability_zones" "azs" {
  state = "available"
}

data "aws_key_pair" "key" {
  key_name           = var.key_pair_name
  include_public_key = true
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["2022-06-01T11-22-27.662Z-cbdef1bf-8e5a-4a36-acdc-ca2b59bd3702"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

