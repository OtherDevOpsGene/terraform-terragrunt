# Lesson 02- Multiple servers

Some guided exercises to get familiar with:
- Multiple configuration files
- `count` meta-argument
- Input variables
- Assigning values
- Local values
- Output values
- Data sources
- Lifecycle
- Style and formatting
- Documentation

## Exercise - Variables

- Change the `Owner` tag on the deployed instances
- Change the names from `webserver` to something else on both instances
- Use a file for repeatability
- Apply the changes
- **Stretch:** Use a variable for the AWS region to deploy, but make it optional

## Exercise - Data sources

- Define instance type as an input variable or a local value
- Lookup the supported architectures and virtualization types
- Lookup an Ubuntu Focal (20.04) AMI ID, filtering on those values
  - Do not include that information in the name filter
- Replace our 2 instances with 3 that use the latest AMI
  - Create, then destroy
- Return the public DNS names
- **Stretch:** Return the AWS AZ of the third new instance

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
| [aws_instance.webserver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
