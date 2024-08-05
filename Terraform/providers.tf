# providers.tf
provider "azurerm" {
  features {}
}

terraform {
  // required providers{
  //   azurerm = {
  //     soure = "hashicorp/azurerm"
  //     version = "~>3.4.0"
  //   }
  // }
  backend "azurerm" {
    resource_group_name  = "my-terraform-state-rg"
    storage_account_name = "myterraformstate2"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
