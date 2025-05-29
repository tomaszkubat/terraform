# terraform

- [About](#about)
- [Modules](#modules)

# About

This repository contains `tf` modules which may be reused in other projects.

The [Terraform Module Releaser](https://github.com/techpivot/terraform-module-releaser) has been used to automate versioning and doc generating.

For modules usage navigate to auto-generated [Github Wiki](https://github.com/tomaszkubat/terraform/wiki).

For testing use [null test module](/null/test/README.md).

# Modules

Supported modules:

- [gcp](/gcp/README.md) - gcp modules.
  - [bq-dataset](/gcp/bq-dataset/README.md) - `BigQuery`dataset with related resources like tables and views.
  - [ps-write-subscription](/gcp/ps-write-subscription/README.md) - `PubSub` write subscription.
- [null](/null/README.md)
  - [test](/null/test/README.md) - test module which may be used 

Each module information contains the following:

- description - a brief note about module purpose.
- prerequisites - steps required to make to use module.
- supported resources - resources managed by module.
- example usage - module example implementation.
