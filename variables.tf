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

variable "db_name" {
  type        = string
  description = "name for the products db"
}

variable "sql_adm_username" {
  type        = string
  description = "username for the sql administrator"
}

variable "sql_adm_password" {
  type        = string
  description = "password for the sql administrator"
}

variable "container_group_name" {
  type        = string
  description = "name of app service"
}

variable "mongodb_port" {
  type        = number
  description = "mongodb port"
  default     = 27017
}

variable "mongodb_adm_username" {
  type        = string
  description = "username for the mongodb administrator"
}

variable "mongodb_adm_password" {
  type        = string
  description = "password for the mongodb administrator"
}
