resource "google_compute_firewall" "allow-http-port" {
    name = "allow-http-port"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["80"]
    }

    target_tags = ["allow-http"]
      
}

resource "google_compute_firewall" "allow-https-port" {
    name = "allow-https-port"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["443"]
    }

    target_tags = ["allow-https"]
      
}

resource "google_compute_firewall" "allow-ssh-port" {
    name = "allow-ssh-port"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["22"]
    }

    target_tags = ["allow-https"]
      
}
