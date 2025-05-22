variable "project_id" {
  description = "<REQUIRED> gcp project id for module resources."
  type        = string
}

variable "subscription_name" {
  description = "<REQUIRED> Subscription name."
  type        = string
}

variable "data_topic_id" {
  description = "<REQUIRED> Fully qualified topic id used to get messages from."
  type        = string
  validation {
    condition     = can(regex("^projects\\/.*\\/topics\\/.*$", var.data_topic_id))
    error_message = "Data topic id doesn't match the regexp."
  }
}

variable "bigquery_data_config" {
  type = object({
    project             = string
    dataset             = string
    table               = string
    drop_unknown_fields = bool
    use_table_schema    = bool
    write_metadata      = bool
  })

  description = "<REQUIRED> BigQuery config used to write data."
}

variable "bigquery_dead_letter_config" {
  type = object({
    project = string
    dataset = string
    table   = string
  })

  description = "<REQUIRED> BigQuery config used to write dead letter."
}
