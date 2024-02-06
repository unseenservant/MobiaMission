terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.14.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
  backend "gcs" {
    bucket  = "mobia-mission-state"
    prefix  = "app-mobia"
  }
}

data "terraform_remote_state" "gke" {
  backend = "gcs"

  config = {
    bucket  = "mobia-mission-state"
    prefix  = "gke"
  }
}
provider "google" {
  project = var.project #data.terraform_remote_state.gke.outputs.project_id
  region  = var.app_region #data.terraform_remote_state.gke.outputs.region
}

data "google_client_config" "default" {}

data "google_container_cluster" "primary" {
  name     = "mobia-mission-aaron-gke"
  location = "us-east1"
}

provider "kubernetes" {
  host = "https://${data.google_container_cluster.primary.endpoint}"

  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}