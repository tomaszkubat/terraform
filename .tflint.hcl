plugin "terraform" {
  enabled = true
  version = "0.12.0"
  preset  = "recommended"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_standard_module_structure" {
  enabled = true
}
