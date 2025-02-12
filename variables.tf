variable "bq_region" {
  default     = "EU"
  description = "<REQUIRED> BQ region; may be a multiregion"
  type        = string
}

variable "configuration_path" {
  description = "<REQUIRED> path to dataset configuration files"
  type        = string
}

variable "dataset_prefix" {
  default     = ""
  description = "<OPTIONAL> dataste prexif"
  type        = string
}

variable "project_id" {
  description = "<REQUIRED> gc project id"
  type        = string
}

variable "test_var" {
  description = "<TEST>"
  type        = string
}
