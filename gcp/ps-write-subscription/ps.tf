# dead letter topic for error handling
resource "google_pubsub_topic" "dead_letter" {
    name = "${var.subscription_name}_dead_letter"
    project = var.project_id

    lifecycle {
        # terraform forces terraform_labels replacement
        ignore_changes = [terraform_labels]
    }
}

# PubSub to BigQuery write subscription for dead letter
resource "google_pubsub_subscription" "dead_letter" {
  depends_on = [ google_pubsub_topic.dead_letter ]

  name    = "${var.subscription_name}_dead_letter"
  project = var.project_id
  topic   = google_pubsub_topic.dead_letter.id

  # no dead letter policy required - the input/output schema is defined and well known, so the write errors would not be thrown
  # dead_letter_policy {}

  # use BigQuery push
  bigquery_config {
    table = "${var.bigquery_dead_letter_config.project}.${var.bigquery_dead_letter_config.dataset}.${var.bigquery_dead_letter_config.table}"
    # Write fields: subscription_name, message_id, publish_time, data, attributes
    write_metadata = true
  }

  expiration_policy {
    # never expires
    ttl = ""
  }

  lifecycle {
    # terraform forces terraform_labels replacement
    ignore_changes = [terraform_labels]
  }
}

# PubSub to BigQuery write subscription for data
resource "google_pubsub_subscription" "data" {
  depends_on = [ google_pubsub_topic.dead_letter ]

  name    = var.subscription_name
  project = var.project_id
  topic   = var.data_topic_id

  dead_letter_policy {
    dead_letter_topic     = google_pubsub_topic.dead_letter.id
    max_delivery_attempts = 5
  }

  # push to BigQuery
  # https://cloud.google.com/pubsub/docs/create-bigquery-subscription
  bigquery_config {
    table = "${var.bigquery_data_config.project}.${var.bigquery_data_config.dataset}.${var.bigquery_data_config.table}"
    # decide which schema should be used - table schema (true) or topic schema (false)
    use_table_schema    = var.bigquery_data_config.use_table_schema
    # decide if additional fields should cause the loading error
    drop_unknown_fields = var.bigquery_data_config.drop_unknown_fields
    # if set to true, additional data will be write to bq table, like publish_time
    write_metadata = var.bigquery_data_config.write_metadata
  }

  expiration_policy {
    # never expires
    ttl = ""
  }

  lifecycle {
    # terraform issue: terraform forces terraform_labels replacement
    ignore_changes = [terraform_labels] 
  }
}
