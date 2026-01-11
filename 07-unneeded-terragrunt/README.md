# Lesson 07 - Unneeded Terragrunt

Some guided exercises to get familiar with:

- Terragrunt lifecycle
- Terragrunt backend handling

Terragrunt is a thin wrapper around Terraform to make large Terraform
configuration easier to maintain than with Terraform alone. In particular, it
espouses DRY (Don't Repeat Yourself) by trading a little declarativeness and
flexibility with some simple convention.

We'll see some of that in a minute. Let's start really basic. The basic takeaway
here is that if you are using Terragrunt you are still using Terraform, just not
directly.

## Group Exercise - Almost hello world again

This Terraform code is the same as Lesson 03 again, with the addition of the
empty file `terragrunt.hcl`.

- Add the `terraform.tfvars` for the `owner_email` and `server_name` variables

Here is how the Terraform lifecycle works in Terragrunt.

```shell
terragrunt init
terragrunt plan
terragrunt apply
```

## Group Exercise - Terragrunt remote backend

We can do something here with Terragrunt that is both easy and uses some
Terragrunt features.

Since Lesson 03 used a local state backend, we see how Terragrunt handles the
backend configuration.

- Add the following to `terragrunt.hcl`, replacing `xxxxxx` with your initials
  and four random digits (doesn't have to be the same as you used earlier, but
  it can be):

```terraform
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket       = "xxxxxx-terragrunt"
    key          = "${path_relative_to_include()}/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}
```

This is a little different than the remote state configuration the Cloud Posse
module generated for use, after it generated the S3 bucket and DynamoDB table
that make up the S3 backend.

- Re-initialize

```console
$ terragrunt init
16:49:11.702 STDOUT terraform: Initializing the backend...
...
16:49:13.005 ERROR  Suggested fixes:
Remote state bucket not found, create it manually or rerun with --backend-bootstrap to provision automatically.
```

Among other things, Terragrunt points out that we haven't created the backend,
which is valid.

- Bootstrap the backend as suggested

```console
$ terragrunt init --backend-bootstrap
Remote state S3 bucket xxxxxx-terragrunt does not exist or you don't have permissions to access it. Would you like Terragrunt to create it? (y/n)
```

Terragrunt helpfully creates a remote backend for us. Next, Terraform offers to
migrate our local state to remote. We could have done that without Terragrunt as
long as we created the remote backend ourselves, e.g., with the Cloud Posse
module.

Not a huge win, but it is an advantage of Terragrunt.

- Apply, just to see what happens

Hopefully it isn't surprising at this point, but idempotency still works here.
We just moved from a local backend to a remote backend, and let Terragrunt
handle the creation of the remote backend.

## Clean up

Please clean up.

```shell
terragrunt destroy
```

We should notice that the remote-backend we created was not cleaned up.
Terragrunt understands that it has a different lifecycle than the EC2 instance
we were creating.

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
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.27.0 |

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
