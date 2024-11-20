
# module "VD01" {
#   source = "./modules/WindowsDesktop"
# }

# module "VD02" {
#   source = "./modules/WindowsDesktop"
# }

module "VD03" {
  source = "./modules/WindowsDesktop"
  ip_address  = "10.206.65.233"
}

# module "VD04" {
#   source = "./modules/WindowsDesktop"
# }