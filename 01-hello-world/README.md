# Lesson 01 - Hello world

Some simple exercises to get used to:

- Terraform
- Terraform CLI
- Idempotency
- Terraform configuration language

## Group Exercise - Hello World

Look at `main.tf` to see the `resource` that we want to create. Ignore the
`terraform` and `provider` blocks for now.

```terraform
resource "aws_instance" "hello_world" {
  # AMI ID from https://cloud-images.ubuntu.com/locator/ec2/
  ami           = "ami-07f75595710e1c42b"
  instance_type = "t4g.nano"

  tags = {
    Name  = "hello_world"
    Owner = "gene@otherdevopsgene.dev"
  }
}
```

We'll get more into the details, but we are specifying that our desired state is
to have an AWS EC2 instance with a specific machine image running on a
`t4g.nano` server with a couple of tags applied. That machine instance happens
to be Ubuntu Linux, but without the comment, we couldn't tell that just by
reading the `resource` block.

Here is the typical Terraform lifecycle to bring our desired state to life.

```shell
terraform init
terraform plan
terraform apply
```

- `init`: set up the directory, download providers, only needed once
- `plan`: check the syntax, check the state, calculate differences
- `apply`: make changes to match desired state

## Group Exercise - Idempotency

Idempotency means we can `apply` our state over and over, and if our desired
state is in place, then no changes will be made.

```shell
terraform apply
```

Try changing the `Owner` tag to a different email and `apply` a few times.

Terraform is:

- **Declarative**: describe the final state, not how to get there
- **Stateful**: track how things are created, not all or nothing when creating
- **Idempotent**: nothing to change means no action to take

## Group Exercise - Goodbye Hello World

Once we are done with our resources, we can turn them off.

```shell
terraform destroy
```

## Group Exercise - Hello Again

But we can recreate them if we want.

```shell
terraform apply
```

## Exercise - Update AWS instance

The documentation for
[aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
has the details of what you can specify and what valid values for each argument
look like.

Change the resource specification as follows:

- Make sure the AWS EC2 instance is EBS optimized
- Enable detailed monitoring
- Add a tag for the Class (capital-C), `Terraform and Terragrunt`
- Apply the changes
- **Stretch:** Require Instance Metadata Service Version 2 (IMDSv2)

Hint: Booleans do not get quoted.

## Clean up

Before Lesson 02, please clean up.

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
| [aws_instance.hello_world](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
