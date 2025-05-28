locals {
  view_schema_files = fileset(local.view_schema_path, "*.json")

  view_config_map = {
    for f in local.view_schema_files :
    # use file name as key - ensures uniqueness across a directory
    f => {
      # remove file extension
      view_name = lower(replace(f, ".json", ""))

      meta_json = file("${local.view_meta_path}${f}")
      #TODO add templatefile
      sql_sql     = file(replace("${local.view_sql_path}${f}"), ".json", ".sql")
      schema_json = file("${local.view_schema_path}${f}")
    }
  }
}

resource "google_bigquery_table" "view" {
  # we expect to create tables before
  depends_on = [ google_bigquery_table.table ]

  for_each = local.view_config_map

  project    = google_bigquery_dataset.dataset.project
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = each.value["table_name"]

  # view definition
  view {
    query          = each.value["sql_sql"]
    use_legacy_sql = false
  }

  schema = each.value["schema_json"]
  labels = try(each.value["meta_json"]["labels"], null)
}
