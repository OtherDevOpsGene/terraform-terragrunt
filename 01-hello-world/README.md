# Lesson 01- Hello world

Some simple exercises to get used to:
- Terraform
- Terraform CLI
- Idempotency
- Terraform configuration language

## Exercise - Update AWS instance

- Make sure the AWS EC2 instance is EBS optimized
- Enable detailed monitoring
- Add a tag for the Class (capital-C), `Terraform Fundamentals`
- Apply the changes
- **Stretch:** Require Instance Metadata Service Version 2 (IMDSv2)

Hint: Booleans do not get quoted.

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

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.hello_world](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
