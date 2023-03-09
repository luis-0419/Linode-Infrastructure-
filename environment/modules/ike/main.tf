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

resource "linode_lke_cluster" "foobar" {
  k8s_version   = var.k8s_version
  label         = var.label
  region        = var.region
  tags          = var.tags

  dynamic "pool" {
      for_each = var.pools
      content {
          type  = pool.value["type"]
          count = pool.value["count"]
      }
    }
}
