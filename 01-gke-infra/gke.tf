data "google_container_engine_versions" "gke_version" {
  location = var.app_region
  version_prefix = "1.27."
}

resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  location   = var.app_region
  cluster    = google_container_cluster.primary.name
  
  version = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]
  node_count = 3

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform" # not best practice, should only scope for least privilege.
    ]

    labels = {
      env = var.project
    }

    preemptible  = true # not good for stateful workloads. This a stateless demo, so no worries
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}


resource "google_container_cluster" "primary" {
  name     = "${var.project}-gke"
  location = var.app_region
  
  # needed for primary cluster creation in GKE
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection         = false
  # 

  network    = google_compute_network.app_vpc.name
  subnetwork = google_compute_subnetwork.app_subnet.name
}