variable "project_id" {
  description = "The ID of the project "
}

variable "region" {
  description = "The region to deploy GKE"
  default     = "us-central1-a"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  default     = "my-gke-cluster"
}

variable "bucket_name" {
  description = "The name of the bucket to create."
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account to grant permissions to."
  type        = string
}