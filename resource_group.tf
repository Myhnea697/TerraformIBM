resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform"
  location = local.region

  //backend "azurerm"{
  // subscription_id        ="51648e6a-44e2-45f9-960b-4022d997f476"
  //resource_group_name     ="terraform"
  //storage_account_name    ="mihnea"
  //container_name          ="da"
  //key                     ="terraform.tfstate"
  //use_azuread_auth        =true 
  //}  
}

