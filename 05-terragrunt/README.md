# Lesson 05 - Terragrunt

Some guided exercises to get familiar with:

- Terraform block
- Provider block
- Local state

## Explanation - Terraform Block

Starting back in Lesson 01, we saw, but largely ignored the `terraform` and
`provider` clocks. This block configures our Terraform specification.

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.27.0"
    }
  }

  required_version = ">= 1.14.3"
}
```

From bottom up, we are explaining that this configuration works with version
`1.14.3` or newer (`>=`) of Terraform. We also use only one provider, `hashicorp/aws`,
which contains the interface from Terraform's configuration language to the AWS
API commands that Terraform will use under the covers. That provider must be a
`6.x.x` version of at least `6.27.0`, but version `7.0.0` or newer is not
acceptable (`~>`).

We are using AWS, but there are also providers for other clouds like Azure or
Google Cloud Platform, frameworks like Kubernetes, Helm, or Active Directory,
and utilities to run external commands or create local files, for example. They
are listed and documented at the [Terraform
Registry](https://registry.terraform.io/browse/providers).

## Explanation - Provider block

The `terraform` block tells Terraform to use the AWS provider, and the
`provider` block configures it.

```terraform
provider "aws" {
  region = var.aws_region
}
```

There are [a lot of
options](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) that
could be specified here, but all we needed was a way to specify the `region` to
work in, which we've made a variable.

## Sidebar- AWS Authorization

The AWS provider [grants
access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration)
to AWS accounts the same way the AWS CLI does.

So if you set up `config` and `credential` files in your `~/.aws` directory,
those will work for Terraform as well. If, as these workstations are configured,
you use AWS managed temporary credentials, that's what Terraform uses.

```shell
aws sts get-caller-identity
aws s3 ls
```

## Group Exercise - Local Backend

Of major importance in the `terraform` block, we can configure the `backend` to
use. We haven't specified any, so we are using the default backend, which is
local and file based. You might have noticed a `terraform.tfstate` file being
created in the directory you are working from, and possibly a
`terraform.tfstate.backup` file as well.

You can view the state file directly, but we have some command-line tools to
make it easier to work with when we need.

```shell
cd ../03-data
terraform show
terraform state list
terraform state show "aws_instance.webserver"
```

Examining state like this is similar to configuring a lot of output values.

## Quick Exercise - Examine State

- Use the state to find the memory size of the configured instance
- **Stretch:** Find the AMI ID for the dynamically selected Ubuntu image

## Group Exercise - Multiple State Files

Run the following AWS CLI command to see all of the instances currently running
in the AWS account:

```shell
aws ec2 describe-instances --region us-east-2 \
  --filters "Name=instance-state-name,Values=running" \
  --query "Reservations[*].Instances[*].InstanceId" \
  --output text
```

Then add an additional filter to show just your instances (from Lessons 02 and
03):

```shell
aws ec2 describe-instances --region us-east-2 \
  --filters "Name=instance-state-name,Values=running" \
            "Name=tag:Owner,Values=gene@otherdevopsgene.dev" \
  --query "Reservations[*].Instances[*].InstanceId" \
  --output text
```

The local state file is how Terraform is able to keep track of which resources
it is managing in each configuration/directory. Without that state, it wouldn't
know what needs to be reconfigured and what needs to be created from scratch.

That setup works fine for a single individual maintaining their own resources,
but can't be shared. Even if you did copy the state file or use `import`
commands to add resources to the state, local state files couldn't prevent
concurrent modifications from leaving resources in an undefined state.

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
