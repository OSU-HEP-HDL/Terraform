module "LIC1" {
  source = "./modules/LicenseServer"
  LIC_PUBLIC_SSH_KEY = var.PUBLIC_SSH_KEY

}

# module "Lic2" {
#   source = "./modules/LicenseServer"
# }

# module "Lic3" {
#   source = "./modules/LicenseServer"
# }