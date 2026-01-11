locals {
  canonical_owner_ids = ["099720109477"]
}

data "aws_ec2_instance_type" "webserver" {
  instance_type = var.instance_type
}

data "aws_ami" "ubuntu_noble" {
  most_recent = true
  owners      = local.canonical_owner_ids

  filter {
    name   = "name"
    values = ["ubuntu/images/*/ubuntu-noble-24.04-*-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = data.aws_ec2_instance_type.webserver.supported_virtualization_types
  }

  filter {
    name   = "architecture"
    values = data.aws_ec2_instance_type.webserver.supported_architectures
  }
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.ubuntu_noble.id
  instance_type = var.instance_type

  ebs_optimized = true
  monitoring    = true

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name  = var.server_name
    Owner = var.owner_email
    Class = var.class_name
  }
}
