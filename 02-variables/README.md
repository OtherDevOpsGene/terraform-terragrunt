# Lesson 02 - Input variables

Some guided exercises to get familiar with:

- Multiple configuration files
- Input variables
- Variable files

## Group Exercise - Multiple files

Rather than a single `main.tf`, this directory uses multiple files.

- `providers.tf` for some set up that rarely changes after a project starts
- `main.tf` where the work really happens

These could be anything ending in `.tf`.

Stand up this single server. Everyone's will look the same - for now.

## Group Exercise - Input variables

Rather than modifying the resource definition every time we want a different
setting, we can use input variables.

Change:

```terraform
  tags = {
    Name  = "webserver"
    Owner = "gene@otherdevopsgene.dev"
    Class = "Terraform and Terragrunt"
  }
  ```

to

```terraform
  tags = {
    Name  = var.server_name
    Owner = var.owner_email
    Class = var.class_name
  }
  ```

Rename `variables.0` to `variables.tf`, then plan the changes (i.e., see what
changes would be made without applying them).

```shell
mv variables.0 variables.tf
terraform plan
```

If the variable has a default value, it does not have to be specified.

Typing values in by hand every time you want to run Terraform is not good
practice, so we can put them in a file.

```shell
terraform plan -var-file=vars.tfvars
```

If the variable file is named `*.auto.tfvars` or `terraform.tfvars`, you don't
even need to call it out on the command line at all.

```shell
mv vars.tfvars terraform.tfvars
terraform plan
```

## Exercise - Modify variables

- Change the `Owner` tag on the deployed instance
- Change the name from `webserver` to something else
- Apply the changes
- **Stretch:** Use a variable for the AWS region to deploy, but make it optional

## Don't clean up

Leave a mess for Lesson 04- we'll be using it as a learning opportunity.

If you already destroyed your instance, good news- with infrastructure-as-code
it is trivial to recreate it.

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

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
