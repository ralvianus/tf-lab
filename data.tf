data "aws_availability_zones" "azs" {
  state = "available"
}

data "aws_key_pair" "key" {
  key_name           = var.key_pair_name
  include_public_key = true
}


