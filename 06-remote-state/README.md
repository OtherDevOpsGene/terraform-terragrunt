# Lesson 06 - Remote state

Some guided exercises to get familiar with:

- Remote state

## Exercise - Add the remote state backend

This lesson is very similar to Lesson 03 - Data and Lesson 04 - State, but we
are going to use a remote state backend.

- Update the `terraform` block in the `providers.tf` file with the backend
  configuration from our previous lesson
  - Use `lesson06` or similar for the `key`
- Apply

## Group Exercise - Remote backend

Now that we have a remote backend, let's repeat looking at the state.

```shell
terraform show
terraform state list
terraform state show "aws_instance.webserver"
```

These commands work the same on a remote state backend as with a local backend.
Only we can't look directly at the `terraform.tfstate` anymore, since it no
longer exists.

```shell
ls -l terraform.tfstate*
```

## Quick Exercise - Examine state

- Use the state to find the memory size of the configured instance
- Find the AMI ID for the dynamically selected Ubuntu image

## Exercise - Clean up

After examining the state, please clean up.

```shell
terraform destroy
```

<!-- terraform-docs markdown table --output-file README.md --output-mode inject . -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.webserver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.ubuntu_noble](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_ec2_instance_type.webserver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_instance_type) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to work in. | `string` | `"us-east-2"` | no |
| <a name="input_class_name"></a> [class\_name](#input\_class\_name) | The name of the class this was created for. | `string` | `"Terraform and Terragrunt"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The AWS EC2 instance type to create. | `string` | `"t4g.nano"` | no |
| <a name="input_owner_email"></a> [owner\_email](#input\_owner\_email) | The email address of the person responsible for the resources. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Base name for the webserver instances. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ami_name"></a> [instance\_ami\_name](#output\_instance\_ami\_name) | The name of the AMI that the instance is using. |
| <a name="output_instance_private_ip"></a> [instance\_private\_ip](#output\_instance\_private\_ip) | Private IP address of the instance. |
<!-- END_TF_DOCS -->
