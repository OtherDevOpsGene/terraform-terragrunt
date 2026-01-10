# Lesson 05 - Modules

Some guided exercises to get familiar with:

- Modules
- Remote state backend

## Modules

One of the strengths of Terraform is that you can reuse your prior work and the
work of others to build out resources. Modules use input variables and output
values to accept and return configuration settings and results. Modules can be
locally-defined (i.e., under the `modules` subdirectory) or can be pulled from
the [HashiCorp Registry](https://registry.terraform.io/browse/modules) and other
sources.

> [!CAUTION]
> Using any third-party module with your cloud credentials is literally giving a
> stranger's code complete access to your account. Some publishers are more
> trustworthy than others- look at the number of downloads as a gauge. At least
> review the plan carefully.

## Exercise - Using a third-party module

- Use the Cloud Posse `tfstate-backend` module to create an AWS S3 bucket and a
  DynamoDB table to manage remote state
  - replace the `xxxxx` placeholders and add Terraform files, as necessary
- Set the namespace to be your initials followed by 4 digits of your choice (to
  keep things globally unique)
- Set the name to be `tfstate`, because we are going to use this for all our
  remote state in the short future we have remaining
- Output the rendered Terraform backend configuration file to the screen

## What we just did

Firstly, we used someone else's code to set up a S3 bucket and a DynamoDB table.
Neither of those is difficult to create on our own, but the module set up
versioning for the bucket and server-side encryption for both the bucket and the
table. Those are good ideas, but left to ourselves, we probably wouldn't have
bothered to get them configured. Now we didn't even need to think about it.

Secondly, the module also gave us some boilerplate code so we can use these
resources to manage **remote state**. We'll get into how to use it as the next
lesson, but for now we have the resources we need to store our state files in a
remote, potentially shared location, rather than only in the directory we
`apply` from. In turn, that will let us work on configurations as a team and not
to rely on our local laptop to track state for corporate resources.

## Not cleaning up is becoming a habit

We are back to not cleaning up after ourselves. But this time, it is a strategic
decision, not just a set up for the next lesson.

Once we have the remote state backend set up, we can and should use that as our
backend forevermore. We will use a different `key` (you'll see) each time to
distinguish states from each other, but they will all go into the single
backend.

In practice, you'll likely end up with a single backend for each cloud account.
All configurations within each of those accounts will share the same backend.
And that backend almost never needs to change, so we can afford to keep its
state local. Plus we have a chicken-and-egg situation creating a remote backend
for the remote backend that is most conveniently handled by just ignoring.

<!-- terraform-docs markdown table --output-file README.md --output-mode inject . -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.27.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tfstate-backend"></a> [tfstate-backend](#module\_tfstate-backend) | cloudposse/tfstate-backend/aws | 1.8.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_terraform_backend_config"></a> [terraform\_backend\_config](#output\_terraform\_backend\_config) | n/a |
<!-- END_TF_DOCS -->
