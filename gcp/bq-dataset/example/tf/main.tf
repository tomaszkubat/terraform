
module "bq_dataset_example_usage" {
  # clone over https example
  # for remote usage use:
  # source = "github.com/tomaszkubat/terraform/gcp/bq-dataset"
  # for local usage use:
  source = "./../../"

  # path to configuration files
  configuration_path = "./../config/my_dataset"

  # input parameters
  project_id = "<YOUR_PROJECT_ID>"
  dataset_prefix = "test_"
}
