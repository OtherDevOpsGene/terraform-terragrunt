terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.27.0"
    }
  }

  required_version = ">= 1.14.3"
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "hello_world" {
  # AMI ID from https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-07f75595710e1c42b"
  instance_type = "t4g.nano"

  tags = {
    Name  = "hello_world"
    Owner = "gene@otherdevopsgene.dev"
  }
}
