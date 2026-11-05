resource "azurerm_redis_cache" "legal_platform" {
  name                = var.redis_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Standard"
  minimum_tls_version = "1.2"
  enable_non_ssl_port  = false
}
