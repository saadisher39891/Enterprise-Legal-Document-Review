# Sanitized AKS node-pool design inspired by a hybrid Windows/Linux workload.
resource "azurerm_kubernetes_cluster_node_pool" "linux" {
  name                  = "linuxapps"
  kubernetes_cluster_id = var.aks_id
  vm_size               = var.linux_vm_size
  node_count            = 3
  enable_auto_scaling   = true
  min_count             = 3
  max_count             = 10
  mode                  = "User"
  os_type               = "Linux"
}
resource "azurerm_kubernetes_cluster_node_pool" "windows" {
  name                  = "winagents"
  kubernetes_cluster_id = var.aks_id
  vm_size               = var.windows_vm_size
  node_count            = 1
  enable_auto_scaling   = true
  min_count             = 1
  max_count             = 5
  mode                  = "User"
  os_type               = "Windows"
  node_labels            = { workload = "ci-build" }
}
