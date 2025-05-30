locals {
  # resource paths - concatenate the relative configuration path with resource subpaths
  dataset_path            = "${var.configuration_path}/dataset/"
  tables_path             = "${var.configuration_path}/tables/"
  views_path              = "${var.configuration_path}/views/"
  views_materialized_path = "${var.configuration_path}/views_materialized/"

  # subpaths
  meta_subpath   = "meta/"
  schema_subpath = "schema/"
  sql_subpath    = "sql/"

  # substitutions
  variables_substitutions = {
    project_id = var.project_id
    # the dataset_id follows format 'projects/{{project}}/datasets/{{dataset_id}}'
    dataset_name = element(regex("datasets/(.*)", google_bigquery_dataset.dataset.id), 0)
  }
}
