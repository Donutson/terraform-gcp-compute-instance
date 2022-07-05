resource "google_compute_instance" "default" {
  name           = var.name
  machine_type   = var.machine_type
  zone           = var.zone
  desired_status = var.desired_status
  tags           = ["chat"]

  boot_disk {
    initialize_params {
      image = var.image
      type  = var.image_type
      size  = var.image_size
    }
  }

  // Local SSD disk
  # scratch_disk {
  #  interface = var.scratch_disk_inyterface
  # }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    ssh-keys = "${var.name}:${file("~/.ssh/google_compute_engine.pub")}"
  }

  connection {
      host        = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
      type        = "ssh"
      user        = var.name
      timeout     = "500s"
      private_key = file("~/.ssh/google_compute_engine")
  }

  provisioner "file" {
    source = "../compose.yml"
    destination = "compose.yml"
  }
  
  provisioner "remote-exec" {
    inline = [
      "curl -L https://get.docker.com | sh",
      "sudo apt-get update",
      "sudo apt-get install docker-compose-plugin -y",
      "sudo docker compose up -d",
    ]
  }

  depends_on = [
    var.dependencies_resources
  ]
  
}