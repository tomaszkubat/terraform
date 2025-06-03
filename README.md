# terraform

[![Check Status](https://github.com/tomaszkubat/terraform/actions/workflows/terraform_check.yml/badge.svg?branch=master)](https://github.com/tomaszkubat/terraform/actions/actions)
[![Release Status](https://github.com/tomaszkubat/terraform/actions/workflows/terraform_release.yml/badge.svg?branch=master)](https://github.com/tomaszkubat/terraform/actions/actions)
[GitHub release](https://github.com/tomaszkubat/terraform/releases/latest)

This repository contains `tf` modules which may be reused in other projects.

<img src='docs/terraform.svg' width='300' height='120'/>

# Modules

Supported modules.

- [gcp](/gcp/README.md) - gcp modules.
  - <img src='https://icons.terrastruct.com/gcp%2FProducts%20and%20services%2FData%20Analytics%2FBigQuery.svg' width='32' height='32' /> [bq-dataset](/gcp/bq-dataset/README.md) - `BigQuery` dataset with related resources like tables and views.
  - <img src='https://icons.terrastruct.com/gcp%2FProducts%20and%20services%2FData%20Analytics%2FCloud%20PubSub.svg' width='32' height='32' /> [ps-write-subscription](/gcp/ps-write-subscription/README.md) - `PubSub` write subscription.
- [null](/null/README.md)
  - [test](/null/test/README.md) - test module which may be used

Each module information contains the following:

- description - a brief note about module purpose.
- prerequisites - steps required to make to use module.
- supported resources - resources managed by module.
- example usage - module example implementation.

# Versioning

The modules follows the semantic versioning. The [Terraform Module Releaser](https://github.com/techpivot/terraform-module-releaser) has been used to automate versioning.

# How to use

For modules usage navigate to auto-generated [Github Wiki](https://github.com/tomaszkubat/terraform/wiki). The [Terraform Module Releaser](https://github.com/techpivot/terraform-module-releaser) has been used to automate doc generating.

For testing use [null test module](/null/test/README.md):

```terraform
module "my_module_usage" {
  source = "github.com/tomaszkubat/terraform/null/test"
}
```
