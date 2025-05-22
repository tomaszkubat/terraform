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

Terraform modules.

## gcp

### bq-dataset

BigQuery dataset with related resources (tables, views, authorizations).

Supported:

| resource | status | description |
|---|---|---|
| dataset  | ✔️ | |
| table  | ✔️ | work in progress |
| view | ❌ | in the future |
| scheduled query | ❌ | in the future |

### ps-write-subsription

### Description

`PubSub` write subscription to `BigQuery` with handling dead letter writes.

### Prerequisites

To use this module it's required to fulfill some prerequisites:
- aa

### Supported resources

| resource | status | description |
|---|---|---|
| data topic | ❌ | assume that the topic (producer) exists in external project |
| data write subscriptions | ✔️ | |
| dead letter write subscriptions for  | ✔️ | |
| dead letter topic  | ✔️ | |
| data table | ❌ | assume that the dataset/table are being created by separate, big query module |
| dead letter table | ❌ | assume that the dataset/table are being created by separate, big query module |

### Example usage

```terraform
module "my_module_usage" {
  # clone over https example
  source = "github.com/tomaszkubat/terraform/gcp/ps-write-subscription"

  # input parameters
  project_id = "<my-project-id>"
  subscription_name = "<subscription-name>"
  data_topic_id = "<fully-qualified-data-topic-id>"
  bigquery_config = {
    project             = "<project_id>"
    dataset             = "<dataset_name>"
    table               = "<table_name>"
    drop_unknown_fields = true
    use_table_schema    = true
    write_metadata      = false
  }
}

```

## null

### Description

Null/dummy resource which may be used to test `terraform` import from `Github`.

### Prerequisites

None.

### Supported resources

No resources supported - modules serves as null dummy/test module.

### Example usage

```terraform
module "my_module_usage" {
  # clone over https example
  source = "github.com/tomaszkubat/terraform/null/test"

  # input parameters
  # <no parameters>
}
```
