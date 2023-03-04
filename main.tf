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

module "aws_vpc" {

}

