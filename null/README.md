# null

- [test](#test)


## test

### Description

Null/dummy resource which may be used to test `terraform` import from `Github`.

### Prerequisites

None.

### Supported resources

No resources supported - modules serves as null dummy/test module.

### Example usage

```terraform
module "my_module_usage" {
  # clone over https example
  source = "github.com/tomaszkubat/terraform/null/test"

  # input parameters
  # <no parameters>
}
```
