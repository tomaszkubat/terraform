locals {
  view_materialized_schema_files = fileset("${local.views_materialized_path}${local.schema_subpath}", "*.json")

  view_materialized_config_map = {
    for f in local.view_materialized_schema_files :
    # use file name as key - ensures uniqueness across a directory
    replace(f, ".json", "") => {
      # remove file extension
      view_name = lower(replace(f, ".json", ""))

      meta_json   = jsondecode(file("${local.views_materialized_path}${local.meta_subpath}${f}"))
      sql_sql     = templatefile(replace("${local.views_materialized_path}${local.sql_subpath}${f}", ".json", ".sql"), local.variables_substitutions)
      schema_json = file("${local.views_materialized_path}${local.schema_subpath}${f}")
    }
  }
}

output "name" {
  value =  local.view_materialized_config_map
}

resource "google_bigquery_table" "view_materialized" {
  # we expect to create tables before
  depends_on = [google_bigquery_table.table]

  for_each = local.view_materialized_config_map

  project    = google_bigquery_dataset.dataset.project
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = each.value["view_name"]

  # materialized view definition
  materialized_view {
    query               = each.value["sql_sql"]
    enable_refresh      = each.value["meta_json"]["enable_refresh"]
    refresh_interval_ms = each.value["meta_json"]["refresh_interval_ms"]
    allow_non_incremental_definition = try(each.value["meta_json"]["allow_non_incremental_definition"], false)
  }
  # schema field shouldn't be used as input with a materialized view, invalid
  # schema = each.value["schema_json"]
  labels = try(each.value["meta_json"]["labels"], null)
}
