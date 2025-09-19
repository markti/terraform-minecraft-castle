terraform {
  required_providers {
    minecraft = {
      source  = "markti/minecraft"
      version = "~> 0.0.26"
    }
  }
}

provider "minecraft" {
  address  = "${var.server_address}:${var.server_port}"
  password = var.rcon_password
}
