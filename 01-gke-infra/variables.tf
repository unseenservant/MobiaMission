# General
variable "project" {
  default = "mobia-mission-aaron"
}
variable "app_region" {
  default = "us-east1"
}

# Cloud Run
variable "app_name" {
  default = "app-mobia"
}
variable "app_image_name" {
  default = "mobiaapp"
}
variable "app_container_port" {
  default = 80
}

# Artifact Registry
variable "artifact_registry_description" {
  default = "mobia Assignment"
}

# Networking
variable "subnetwork_name" {
  default = "app-subnetwork"
}
variable "subnetwork_cidr" {
  default = "3.121.56.0/24"
}
variable "vpc_name" {
  default = "app-network"
}
