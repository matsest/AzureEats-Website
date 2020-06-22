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
  name                = var.app_service_name
  location            = azurerm_resource_group.app.location
  resource_group_name = azurerm_resource_group.app.name
  app_service_plan_id = azurerm_app_service_plan.website.id

  app_settings = var.app_settings

}

