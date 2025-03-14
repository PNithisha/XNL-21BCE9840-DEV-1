provider "google" {
  project = "your-gcp-project"
  region  = "us-central1"
}

resource "google_container_cluster" "gke" {
  name     = "multi-cloud-gke"
  location = "us-central1-a"
  initial_node_count = 2
}
