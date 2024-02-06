# General
variable "project" {
  default = "mobia-mission-aaron"
}
variable "app_region" {
  default = "us-east1"
}

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

variable "account_id_project_owner_sa_sa" {
  default = "project-owner-access"
}
variable "display_name_project_owner_sa_sa" {
  default = "Project Owner Access"
}
