terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
  required_version = ">= 0.13"
}

provider "openstack" {
	token = var.token
	auth_url    = "https://identity.cloud.muni.cz/v3"
	region      = "brno1"
	allow_reauth = false
}

resource "openstack_compute_instance_v2" "terra_ubuntu" {
	name = var.instance_name
	image_name = "ubuntu-focal-x86_64"
	flavor_name = var.flavor
	key_pair = var.ssh

    network {
        uuid = var.local_network_id
    } 
}
