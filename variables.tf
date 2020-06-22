variable "rg_name" {
  type        = string
  description = "name of resource group"
}

variable "location" {
  type        = string
  description = "location of resource group"
}

variable "app_service_name" {
  type        = string
  description = "name of app service"
}

variable "app_settings" {
  type        = map(string)
  description = "object containing app settings for the app service"
}
