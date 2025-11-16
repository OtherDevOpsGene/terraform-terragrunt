resource "aws_instance" "webserver" {
  # AMI ID from https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-07f75595710e1c42b"
  instance_type = "t4g.nano"

  ebs_optimized = true
  monitoring    = true

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name  = "webserver"
    Owner = "gene@otherdevopsgene.dev"
    Class = "Terraform and Terragrunt"
  }
}
