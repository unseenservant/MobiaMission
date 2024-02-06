resource "google_compute_subnetwork" "app_subnet" {
  name          = var.subnetwork_name
  ip_cidr_range = var.subnetwork_cidr
  region        = var.app_region
  network       = google_compute_network.app_vpc.id
  depends_on    = [google_compute_network.app_vpc]
}
resource "google_compute_network" "app_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}
resource "google_compute_firewall" "allow_http_to_subnet" {
  name    = "allow-http-to-subnet"
  network = google_compute_network.app_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  destination_ranges = ["3.121.56.0/24"]
}