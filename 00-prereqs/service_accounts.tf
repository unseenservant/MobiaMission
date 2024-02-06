# # Service Account for Artifact Registry Access
# resource "google_service_account" "artifact_registry_sa" {
#   account_id   = var.account_id_artifact_registry_sa
#   display_name = var.artifact_registry_description
# }

# resource "google_service_account_key" "artifact_registry_sa_key" {
#   service_account_id = google_service_account.artifact_registry_sa.name
#   public_key_type    = "TYPE_X509_PEM_FILE"
#   depends_on         = [google_service_account.artifact_registry_sa]
# }

# # Granting Artifact Registry Administrator role to the service account
# resource "google_project_iam_member" "artifact_registry_sa_role" {
#   project = var.project
#   role    = "roles/artifactregistry.admin"
#   member  = "serviceAccount:${google_service_account.artifact_registry_sa.email}"
# }

# Service Account with Owner access to the project
resource "google_service_account" "project_owner_sa" {
  account_id   = var.account_id_project_owner_sa_sa
  display_name = var.display_name_project_owner_sa_sa
}

# resource "google_service_account_key" "project_owner_sa_key" {
#   service_account_id = google_service_account.project_owner_sa.name
#   public_key_type    = "TYPE_X509_PEM_FILE"
#   depends_on         = [google_service_account.project_owner_sa]
# }

# Granting Owner role to the service account
resource "google_project_iam_member" "project_owner_sa_role" {
  project = var.project
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.project_owner_sa.email}"
}