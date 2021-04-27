provider "google" {
  project     = "qwiklabs-gcp-04-db026395c235"
  region      = "us-central-1"
}

module "instances" {
	source = "./modules/instances"
}


#module "storage" {
#	source = "./modules/storage"
#}


# gs bucket backend
terraform {
  backend "gcs" {
    bucket  = "qwiklabs-gcp-04-db026395c235"
    prefix  = "terraform/state"
  }
}
