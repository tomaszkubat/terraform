locals {
  # resource paths - concatenate the relative configuration path with resource subpaths
  dataset_path = "${var.configuration_path}/dataset/"
  tables_path = "${var.configuration_path}/tables/"
  views_path = "${var.configuration_path}/views/"
  # subpaths
  meta_subpath   = "meta/"
  schema_subpath = "schema/"
  sql_subpath    = "sql/"
}
