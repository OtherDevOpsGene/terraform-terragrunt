# Lesson 06- webserver

Exercise to practice with multiple environments.
- Workspaces

## Exercise - Multiple environments

- Directory `06-webserver` is pretty much `03-simple-module`
- Add a variable and tag called `Environment`
- Use workspaces to stand up a `dev` environment
- Use workspaces to stand up a `prod` environment
- Confirm that each environment has different private IP addresses
- Tear down the `dev` environment, leaving `prod` running
  - Workspace and resources


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.49.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_www"></a> [www](#module\_www) | ./modules/webserver | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to work in. | `string` | `"us-east-2"` | no |
| <a name="input_class_name"></a> [class\_name](#input\_class\_name) | The name of the class this was created for. | `string` | `"Terraform Fundamentals"` | no |
| <a name="input_owner_email"></a> [owner\_email](#input\_owner\_email) | The email address of the person responsible for the resources. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Base name for the webserver instances. | `string` | `"webserver"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_ips"></a> [private\_ips](#output\_private\_ips) | Private IP addresses by instance. |
<!-- END_TF_DOCS -->