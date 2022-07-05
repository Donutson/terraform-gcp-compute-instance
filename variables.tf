variable "project_name" {
  description = "project name"
  type        = string
}


variable "region" {
  description = "region to provision the resources"
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  description = "compute instance zone"
  type        = string
  default     = "europe-west1-b"
}


variable "name" {
  description = "compute instance name"
  type        = string
}


variable "machine_type" {
  description = "compute instance machine type"
  type        = string
  default     = "n1-standard-1"
}


variable "image" {
  description = "disk image"
  type        = string
  # default     = "ubuntu-2004-focal-v20220615"
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}


variable "image_type" {
  description = "boot disk type"
  type        = string
  default     = "pd-standard"
}


variable "image_size" {
  description = "image disk size"
  type        = number
  default     = 30
}


variable "network" {
  description = "network interface for the instance"
  type        = string
}


variable "subnetwork" {
  description = "subnetwork interface for the instance"
  type        = string
}


# variable "scratch_disk_inyterface" {
#  description = " the scratch disk interface"
#  type        = string
#  default     = "SCSI"
#} 


variable "desired_status" {
  description = "the instance desired status"
  type        = string
  default     = "RUNNING"
}


variable "dependencies_resources" {
  description = "resource to be create before creating the instance"
  type        = list
}