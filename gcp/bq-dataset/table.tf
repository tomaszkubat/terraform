locals {
  table_schema_files = fileset(local.table_schema_path, "*.json")

  table_config_map = {
    for f in local.table_schema_files :
    # use file name as key - ensures uniqueness across a directory
    f => {
      # remove file extension
      table_name = lower(replace(f, ".json", ""))

      # schema and meta files are mandatory
      schema_json = file("${local.table_schema_path}${f}")
      meta_json   = file("${local.table_meta_path}${f}")
    }
  }
}

resource "google_bigquery_table" "table" {
  for_each = local.table_config_map

  project    = google_bigquery_dataset.dataset.project
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = each.value["table_name"]

  schema = each.value["schema_json"]
  labels = try(each.value["meta_json"]["labels"], null)
}
