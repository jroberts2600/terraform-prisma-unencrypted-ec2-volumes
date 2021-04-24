# Setup Prisma execution information
terraform {
    required_providers {
        prismacloud = {
            source = "PaloAltoNetworks/prismacloud"
            version = "1.1.2"
        }
    }
}

# Configure the prismacloud provider https://registry.terraform.io/providers/PaloAltoNetworks/prismacloud/latest/docs 
provider "prismacloud" {
    # Configuration options
    url = var.apiurl
    username = var.pc_access_key
    password = var.pc_secret_key
    protocol = "https"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}
