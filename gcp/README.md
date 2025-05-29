# gcp

- [bq-dataset](#bq-dataset)
- [ps-write-subscription](#ps-write-subsription)

## bq-dataset

### Description

BigQuery dataset with related resources (tables, views, authorizations).

### Prerequisites

To use this module it's required to fulfill some prerequisites:
- create at least minimal configurations - an example one may be used

### Supported resources

| resource | status | description |
|---|---|---|
| `dataset`  | ✔️ | |
| `table` - `native`  | ✔️ | |
| `table` - `external`  | ❌ | in the future|
| `view` - `native` | ✔️ | native views only|
| `view` - `materialized` | ❌ | in the future |
| `scheduled query` | ❌ | in the future |
| `iam` | ❌ | in the future |
| `authorizations` | ❌ | in the future |

### Example usage

```terraform
module "bq_dataset_example_usage" {
  # clone over https example
  source = "github.com/tomaszkubat/terraform/gcp/bq-dataset"

  # path to configuration files
  configuration_path = "./../config/my_dataset"

  # input parameters
  project_id = "<YOUR_PROJECT_ID"
  dataset_prefix = "test_"
}
```

For more details see [example config](/gcp/bq-dataset/example/).

## ps-write-subsription

### Description

`PubSub` write subscription to `BigQuery` with handling dead letter writes.

### Prerequisites

To use this module it's required to fulfill some prerequisites:
- pubsub `topic` - created in any GCP project, which will serve as and data endpoint,
- `iam` permissions added to attach subscription on the `topic`,
- `bq` tables for data and dead letter already created.

### Supported resources

| resource | status | description |
|---|---|---|
| data topic | ❌ | assume that the topic (producer) exists in external project |
| data write subscriptions | ✔️ | |
| dead letter write subscriptions | ✔️ | |
| dead letter topic  | ✔️ | |
| data table | ❌ | assume that the dataset/table are being created by separate, big query module |
| dead letter table | ❌ | assume that the dataset/table are being created by separate, big query module |

### Example usage

```terraform
module "my_module_usage" {
  # clone over https example
  source = "github.com/tomaszkubat/terraform/gcp/bq-dataset"

  # input parameters
  topic_id = "<fully-qualified-data-topic-id>"

  project_id = "<my-project-id>"
  subscription_name = "<subscription-name>"

  bigquery_data_config = {
    project             = "<project_id>"
    dataset             = "<dataset_name>"
    table               = "<table_name>"
    drop_unknown_fields = true
    use_table_schema    = true
    write_metadata      = false
  }
  bigquery_dead_letter_config = {
    project             = "<project_id>"
    dataset             = "<dataset_name>"
    table               = "<table_name>"
  }
}
```

You can use example configuration included in `bq-dataset/example` to create a dummy resource in your project.
