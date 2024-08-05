# main.tf
resource "azurerm_resource_group" "myrg" {
  name     = "myrg-resources"
  location = var.location
}

resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-vnet"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "mysnet" {
  name                 = "mysnet-subnet"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "mynic" {
  name                = "mynic-nic"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

// resource "azurerm_linux_virtual_machine" "myvm" {
//   name                = "myvm"
//   resource_group_name = azurerm_resource_group.myrg.name
//   location            = azurerm_resource_group.myrg.location
//   size                = var.vm_size
//   admin_username      = var.admin_username
//   network_interface_ids = [
//     azurerm_network_interface.mynic.id,
//   ]

//   # Set disable_password_authentication to false
//   disable_password_authentication = false

//   admin_password = "P@ssw0rd1234!" # This is for testing; use a secure method in production

//   os_disk {
//     caching              = "ReadWrite"
//     storage_account_type = "Standard_LRS"
//   }
//   #source_image_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-image-rg/providers/Microsoft.Compute/images/Ubuntu2004LTS"
//   source_image_reference {
//     publisher = "Canonical"
//     offer     = "UbuntuServer"
//     sku       = "18.04-LTS"
//     version   = "latest"
//   }

//   tags = {
//     environment = "Testing"
//   }
// }
