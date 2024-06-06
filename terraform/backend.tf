terraform {
 backend "gcs" {
   bucket  = "gke-deployment"
   prefix  = "terraform/state"
 }
}