remote_state {
  backend = "s3"

  config = {
    bucket         = "gg1234-terragrunt"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "gg1234-terraform-locks"

    key = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-2"
}
EOF
}