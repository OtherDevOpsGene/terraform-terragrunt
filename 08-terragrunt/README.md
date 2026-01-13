# Lesson 08 - Terragrunt

Some guided exercises to get familiar with:

- A real Terragrunt problem

Where Terragrunt actually makes sense is when we start handling multiple
variations of a configuration. Often these appear with duplicated and nearly
duplicated files in parallel directories.

## Discussion- The DRY problem

You have a configuration for a full environment: web servers, load balancers,
database backends. You want the environment stood up in production, staging, and
development.

If those are identical, same sized instances, same number of instances, etc.,
then the same IaC code would work for all three. No problems.

Even if there are minor differences, say the number of redundant instances and
the size of the database servers, those differences could be handled with
variables and some organized file naming, e.g., `prod.tfvars`, `staging.tfvars`,
and `dev.tfvars`. Still, no issue for Terraform on its own.

However, what if the three environments all live in different AWS accounts.
There are Terraform-only solutions, but pointint the remote backend at one
account to manage state in another is not usually what you are trying to do. And
The `terraform` block doesn't allow variables.

And if you could argue production and development should look identical, but
most of us deal with a simpler (and less expensive) architecture in dev than in
prod. And that means copying code around to make little changes here and there.
Modules absolutely help, but eventually you develop some parallel code trees,
and Terraform doesn't have any sort of variable inheritance or hierarchy. This
is where Terragrunt shines.

## Example - A Terragrunt skeleton

I had Copilot generate a Terragrunt skeleton for us, and this is what it came up
with. 

Always impressed with itself, Copilot liked this structure because:

- Zero duplication — modules live once, environments reuse them
- Clear separation — Terragrunt handles orchestration, Terraform handles resources
- Automatic state isolation — each environment + stack gets its own state
- Easy to scale — add new stacks or environments without refactoring
- Terragrunt-friendly — uses `path_relative_to_include()` correctly

The key for me is that it shows how the `terragrunt.hcl` files all point home to
create a hierarchy.

## Why not Terragrunt?

As important as when to use Terragrunt, is when not to. If you can keep things
simple, separate environments using variable files, and keep different
environments almost identical for consistency sake, you'll be happier. 

As soon as you need a variable in your `backend`, you'll almost certainly want
Terragrunt. Until then, revel in the simplicity of straightforward, declarative
code. 

## Fin.
