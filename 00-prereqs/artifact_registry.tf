resource "google_artifact_registry_repository" "app_mobia_repo" {
  location      = var.app_region
  repository_id = var.app_name
  description   = var.artifact_registry_description
  format        = "DOCKER"
}
