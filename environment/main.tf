terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}
//Use the Linode Provider
provider "linode" {
  token = var.token
}

module "IKE" {
source      = "./modules/ike"

k8s_version = var.k8s_version
label       = var.label
region      = var.region
tags        = var.tags
}