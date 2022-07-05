module "vpc" {
  source                = "github.com/Donutson/terraform-gcp-vpc"
  subnet_name           = var.subnet_name
  project_name          = var.project_name
  network_name          = var.network_name
  firewall_egress_name  = var.firewall_egress_name
  firewall_ingress_name = var.firewall_ingress_name
}


module "instance" {
  source                 = "../"
  project_name           = var.project_name
  name                   = var.compute_instance_name
  network                = module.vpc.network_name
  subnetwork             = module.vpc.subnetwork_name
  dependencies_resources = [module.vpc.firewall_ingress, module.vpc.firewall_egress]
}
