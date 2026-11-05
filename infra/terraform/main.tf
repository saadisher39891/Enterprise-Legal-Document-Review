# Terraform layout for Azure, AKS and ACR
# Environment-specific modules belong under environments/dev, staging and prod.
module "acr" { source = "../../modules/acr" }
module "aks" { source = "../../modules/aks" }
module "monitoring" { source = "../../modules/monitoring" }
