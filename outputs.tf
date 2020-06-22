output "url" {
  value = format("https://%s", azurerm_app_service.website.default_site_hostname)
}
