# Lesson 03- Data sources and Output values

Some guided exercises to get familiar with:

- Local values
- Data sources
- Output values

## Group Exercise - Data sources

Sometimes we don't need to create a resource but we don't know what the value
is to specify it as an input variable. In these cases, we can use a data source.

For example, we've been hard coding the AMI ID for the Ubuntu Noble operating
system. The value we are using happens to be a few months old. If we wanted, we
could look up the latest ID manually every time we built, or we can have
Terraform look it up for us.

Create a `terraform.tfvars` file for your instance, making sure to use the same
email address for the owner as you did in Lesson 02 (so we can group instances
that you created) and a different server name (so we can tell the Lesson 03
instance from the Lesson 02 instance).

Apply the configuration to create the instance.

## Group exercise - Output values

Notice the output from the `terraform apply`. It includes some output values
that were defined in `outputs.tf`. This is how you find out what values were
assigned to resources that you created dynamically.

Add new outputs to the `outputs.tf` to retrieve:

- The memory size of the instance type
- The public DNS name of the instance

## Don't clean up, again

Leave everything running for Lesson 04. These instances will be the examples in
our next lesson.

If you already did `terraform destroy`, remember you can recreate what you need
with `terraform apply`.

<!-- terraform-docs markdown table --output-file README.md --output-mode inject . -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.13.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.16.0 |

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
