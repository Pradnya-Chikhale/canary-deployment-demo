provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  initial_node_count = 1
}

resource "google_container_node_pool" "primary_nodes" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_size_gb = "10"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}


resource "google_storage_bucket" "terraform_state" {
  name                        = var.bucket_name
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "storage_admin" {
  bucket = google_storage_bucket.terraform_state.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${var.service_account_email}"
}

resource "google_storage_bucket_iam_member" "object_viewer" {
  bucket = google_storage_bucket.terraform_state.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${var.service_account_email}"
}
