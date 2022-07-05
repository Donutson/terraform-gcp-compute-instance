variable "project_name" {
  description = "project name"
  type        = string
  default     = "test"
}


variable "region" {
  description = "region to provision the resources"
  type        = string
  default     = "europe-west1"
}


variable "zone" {
  description = "the zone we will provision all the resources"
  type        = string
  default     = "europe-west1-b"
}


variable "subnet_name" {
  description = "subnet name"
  type        = string
  default     = "rocketchat-subnet"
}


variable "network_name" {
  description = "vpc name"
  type        = string
  default     = "test" 
}


variable "firewall_ingress_name" {
  description = "the ingress firewall name"
  type        = string
  default     = "test-allow-ingress"
}


variable "firewall_egress_name" {
  description = "the egress firewall name"
  type        = string
  default     = "test-allow-egress"
}


variable "compute_instance_name"{
  type        = string
  default     = "test"
}