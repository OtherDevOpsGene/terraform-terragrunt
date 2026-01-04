# Lesson 08- Extra exercises

Self-guided exercises to continue learning Terraform and modules.

- Local module
- `count` meta-argument
- `for_each` meta-argument

## Update - Remote backend

- Update the `terraform` block in the `providers.tf` file with the backend
  configuration from our previous lesson
  - Use a different `key` than before (e.g., `lesson08/terraform.tfstate`)
- Apply

## Examine - Local module

Take a moment to look at the module code under `modules/webserver` and see
how input variables and output values are used to pass values from our top-level
code down to the `webserver` module and then back up top.

## Exercise - Double

See <https://developer.hashicorp.com/terraform/language/meta-arguments/count>.

- Change the code to produce two web servers
- Make sure the servers are named appropriately (not identically)
- No other changes
- Apply or plan the changes
- Observe the plan, make note of any unexpected behavior
- *Hint:* The module does not need any changes

## Exercise - Availability zones

See
<https://developer.hashicorp.com/terraform/language/meta-arguments/count#create-multiple-instances-of-module-resources>.

- Define a local value with a list: `["us-east-2a", "us-east-2c"]`
- Add an input variable to the module for availability zone
  - The module **does** change this time
- Redeploy so one server is in `us-east-2a`, the other in `us-east-2c`

## Exercise - for_each

See
<https://developer.hashicorp.com/terraform/language/meta-arguments/for_each>.

- Comment out the private IP address output value for now
- Use `for_each` to deploy to `us-east-2a` and `us-east-2c`
- Redeploy, watching the plan
- Add `us-east-2b`
- Redeploy, watching the plan
- **Stretch:** Replace local value with data source
- **Bigger stretch:** Fix the output value to work

## Exercise - Keep instances running

See
<https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_instance_state>.

- Change the `webserver` module to add the state as `running`
- Use the `aws_ec2_instance_state` resource
- `Apply` to add the state, but it may take a second `apply` to see results

## Exercise - Clean up

Before finishing, please clean up.

```shell
terraform destroy
```

<!-- terraform-docs markdown table --output-file README.md --output-mode inject . -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.16.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_www"></a> [www](#module\_www) | ./modules/webserver | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to work in. | `string` | `"us-east-2"` | no |
| <a name="input_class_name"></a> [class\_name](#input\_class\_name) | The name of the class this was created for. | `string` | `"Terraform Fundamentals"` | no |
| <a name="input_owner_email"></a> [owner\_email](#input\_owner\_email) | The email address of the person responsible for the resources. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Base name for the webserver instances. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IP address for the webserver instance. |
<!-- END_TF_DOCS -->