

provider "google" {
  project     = "qwiklabs-gcp-04-c0b34c09dc2b"
  region      = "us-central-1"
}

module "instances" {
	source = "./modules/instances"
}


module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 2.5.0"

    project_id   = "qwiklabs-gcp-04-c0b34c09dc2b"
    network_name = "terraform-vpc"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-central1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-central1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
       
    ]

}


resource "google_compute_firewall" "tf_firewall" {
  name    = "tf-firewall"
  network = "terraform-vpc"
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80" ]
  }

}

