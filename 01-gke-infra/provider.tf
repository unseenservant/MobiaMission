terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.14.0"
    }
  }
  backend "gcs" {
    bucket  = "mobia-mission-state"
    prefix  = "gke"
  }
}

provider "google" {
  project = "mobia-mission-aaron"
  region  = "us-east1"
}
