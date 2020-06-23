resource "azurerm_resource_group" "app" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_app_service_plan" "website" {
  name                = "${var.app_service_name}-plan"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "website" {
  name                = "${var.app_service_name}-with-db"
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  app_service_plan_id = azurerm_app_service_plan.website.id

  https_only = true

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "10.15.2",
    "ApiUrl"                       = "/api/v1",
    "ApiUrlShoppingCart"           = "/api/v1",
    "MongoConnectionString"        = format("mongodb://%s:27017", azurerm_container_group.app.ip_address)
    "SqlConnectionString"          = module.sql_database.connection_string
    "productImagesUrl"             = "https://raw.githubusercontent.com/microsoft/TailwindTraders-Backend/master/Deploy/tailwindtraders-images/product-detail",
    "Personalizer__ApiKey"         = "",
    "Personalizer__Endpoint"       = ""
  }
}

module "sql_database" {
  source              = "Azure/database/azurerm"
  version             = "1.1.0"
  resource_group_name = "${azurerm_resource_group.app.name}-db"
  location            = azurerm_resource_group.app.location
  db_name             = var.db_name
  sql_admin_username  = var.sql_adm_username
  sql_password        = var.sql_adm_password
}

resource "azurerm_container_group" "app" {
  name                = var.container_group_name
  resource_group_name = azurerm_resource_group.app.name
  location            = azurerm_resource_group.app.location
  ip_address_type     = "public"
  dns_name_label      = var.container_group_name
  os_type             = "Linux"

  container {
    name   = "shoppingcartdb"
    image  = "mongo:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 27017
      protocol = "TCP"
    }
  }
}
