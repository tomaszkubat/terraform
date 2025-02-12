variable "bq_region" {
    type = string
    descsription = "<REQUIRED> BQ region; may be a multiregion"
    default = "EU"
}

variable "configuration_path" {
    type = string
    description = "<REQUIRED> path to dataset configuration files"
}

variable "dataset_prefix" {
    type = string
    desription = "<OPTIONAL> dataste prexif"
    default = ""
}

variable "project_id" {
    type = string
    description = "<REQUIRED> gc project id"
}
