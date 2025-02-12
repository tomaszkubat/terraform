# terraform

- [About](#about)
- [Modules](#modules)
  - [gcp](#gcp)
  - [null](#null)

# About

This repository contains `tf` modules which may be reused in other projects.

The [Terraform Module Releaser](https://github.com/techpivot/terraform-module-releaser) has been used to automate versioning and doc generating.

For modules usage navigate to auto-generated [Github Wiki](https://github.com/tomaszkubat/terraform/wiki).

For testing use [null module](#null).

# Modules

## gcp

### bq-dataset

BigQuery dataset with related resources (tables, views, authorizations).

Supported:

| resource | status | description |
|---|---|---|
| dataset  | ✔️ | |
| table  | ❌ | in the future |
| view | ❌ | in the future |


### ps-write-subsription

`PubSub` write subscription to `BigQuery`.

TBC

## null

Null/dummy resource which may be used to test `terraform` importf from `Github`.


```terraform
module "my_module_usage" {
  source = "git@github.com:tomaszkubat/terraform.git?ref=null/test"
}
```