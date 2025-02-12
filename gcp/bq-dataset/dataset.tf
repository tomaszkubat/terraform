locals {
  # get dataset configuration data
  dataset_meta_file_content = jsondecode(file("dataset/dataset.meta"))
  dataset_id                = "${dataset_prefix}${dataset_meta_file_content["dataset_name"]}"
}

resource "google_bigquery_dataset" "dataset" {
  project = var.project_id

  dataset_id    = local.dataset_id
  description   = local.dataset_meta_file_content["description"]                          # REQUIRED
  friendly_name = try(local.dataset_meta_file_content["friendly_name"], local.dataset_id) # OPTIONAL
  labels        = try(local.dataset_meta_file_content["labels"], null)                    # OPTIONAL
  location      = var.bq_region
}
