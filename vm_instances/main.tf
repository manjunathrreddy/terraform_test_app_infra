
resource "google_compute_instance" "default" {

    count = "${var.machine_count}"
    name = "list-${count.index+1}"
    machine_type = "${var.environment != "production" ? var.machine_type : var.machine_type_dev}"
    

    zone = "asia-south1-a"
    can_ip_forward = "false"
    description = "This is our virtual machines"

        tags = ["allow-http","allow-https"]

  


    boot_disk {
        initialize_params {
            image = "${var.image}"
            size = "20"
        }
    }


    network_interface {
        network = "default"
    }


    metadata = {
        size = "20"
        foo = "bar"
    }

    metadata_startup_script = "curl -sSO https://dl.google.com/cloudagents/install-monitoring-agent.sh && sudo bash install-monitoring-agent.sh"


    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }

}