resource "google_compute_instance" "tf-instance-1" {
  project      = "qwiklabs-gcp-04-db026395c235"
  name         = "tf-instance-1"
  machine_type = "n1-standard-2"
  allow_stopping_for_update = true
  zone         = "us-central1-a"


 boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "terraform-vpc"
    subnetwork = "subnet-02"
    access_config {
    }
  }

}

resource "google_compute_instance" "tf-instance-2" {
  project      = "qwiklabs-gcp-04-db026395c235"
  name         = "tf-instance-2"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

 boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "terraform-vpc"
    subnetwork = "subnet-01"
    access_config {
    }
  }

}
