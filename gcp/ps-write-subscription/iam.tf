# subscriber role to read data messages...
resource "google_pubsub_subscription_iam_binding" "data_subscriber" {
  depends_on = [google_pubsub_subscription.data]

  project      = var.project_id
  subscription = google_pubsub_subscription.data.id
  role         = "roles/pubsub.subscriber"
  members = [
    "serviceAccount:${local.project_pubsub_sa}"
  ]
}

# ... and dead letter messages
resource "google_pubsub_subscription_iam_binding" "dead_letter_subscriber" {
  depends_on = [google_pubsub_subscription.dead_letter]

  project      = var.project_id
  subscription = google_pubsub_subscription.dead_letter.id
  role         = "roles/pubsub.subscriber"
  members = [
    "serviceAccount:${local.project_pubsub_sa}"
  ]
}

# publisher role to publish dead letter messages
resource "google_pubsub_topic_iam_binding" "dead_letter_publisher" {
  project = var.project_id
  topic   = google_pubsub_topic.dead_letter.id
  role    = "roles/pubsub.publisher"
  members = [
    "serviceAccount:${local.project_pubsub_sa}"
  ]
}
