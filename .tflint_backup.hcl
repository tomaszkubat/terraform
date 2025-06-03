plugin "terraform" {
    enabled = true
    source  = "github.com/terraform-linters/tflint-ruleset-terraform"
    version = "0.3.0"
}

rule "terraform_standard_module_structure" {
  enabled = true # each module should have a main.tf file
}
