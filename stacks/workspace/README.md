<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apse1_vpc"></a> [apse1\_vpc](#module\_apse1\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.13 |
| <a name="module_use1_vpc"></a> [use1\_vpc](#module\_use1\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.13 |
| <a name="module_usw2_vpc"></a> [usw2\_vpc](#module\_usw2\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.13 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Map of key,value pairs to tag all resources. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->