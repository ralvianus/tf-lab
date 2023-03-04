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
    values = ["1093-a-20ff594f-0f6a-4107-9040-561845b36647-22051-20ff594f-0f6a-4107-9040-561845b36647"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

