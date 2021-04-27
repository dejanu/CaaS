resource "google_storage_bucket" "qwiklabs-gcp-04-db026395c235" {
  name = "qwiklabs-gcp-04-db026395c235"
  location    = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}
