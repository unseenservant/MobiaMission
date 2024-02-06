resource "google_storage_bucket" "mobia_mission_state" {
  name     = "mobia-mission-state"
  location = "US-EAST1"
  # force_destroy = true
  versioning {
    enabled = true
  }
}