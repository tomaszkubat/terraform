data "google_project" "project" {
  project_id = var.project_id
}

locals {
  # project level pubsub service account
  # currently there is no direct option to use a custom sa
  project_pubsub_sa = "service-${data.google_project.project.number}@gcp-sa-pubsub.iam.gserviceaccount.com"
}
