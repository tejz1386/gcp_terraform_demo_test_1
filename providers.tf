## Configure Remote backend
terraform {
  backend "remote" {}
}

# Configure the Google Provider
provider "google" {
  project     = var.project
  region      = var.region
  credentials = var.credentials
}

# # Configure the Azure Provider
# provider "azurerm" {
#   #features {}
#   subscription_id = var.subscription_id
# }