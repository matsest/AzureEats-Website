# Challenge 01

> https://github.com/Terraform-On-Azure-Workshop/terraform-azure-hashiconf2020/blob/main/challenges/challenge1/Readme.md

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.23 |
| azurerm | ~> 2.15 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 2.15 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_service\_name | name of app service | `string` | n/a | yes |
| app\_settings | object containing app settings for the app service | `map(string)` | n/a | yes |
| location | location of resource group | `string` | n/a | yes |
| rg\_name | name of resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| url | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## More information

- [Terraform on Azure Coding Challenges landing page](https://terraform-on-azure-workshop.github.io/)
