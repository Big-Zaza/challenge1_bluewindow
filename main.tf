provider "google" {
    credentials = file("gcp_bluewindow.json")
    project = "dazzling-botany-399210"
    region = "us-central1"
    zone = "us-central1a"
}

resource "google_compute_instance" "bluewindow_server" {
    name = "bluewindow-server"
    machine_type = "n1-standard-1"
    zone = "us-central1-a"
    boot_disk {
      initialize_params {
        image = "ubuntu-os-cloud/ubuntu-2004-lts"
      }
    }
    network_interface {
      network = "default"  //This enables private ip address
      access_config {}   //This enables public ip address
    }
}

