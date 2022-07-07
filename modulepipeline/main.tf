 module "configuration1" {
 source = "./NIC"
  nic = "priyanka_nic"
  ipconfig = "priyankaip"
  vsubid = module.configuration4.vsubid
  location = "eastus"
  rg = module.configuration2.rgid
}
module "configuration2" {
  source = "./Resource_Group"
  resource_group = "priyankaRG5"
  location = "eastus"
  }

module "configuration3" {
  source = "./VM"
  vm= "priyankavm1"
  size = "standard_f2"
  vmuser_name = "priyankaweb1"
  user_password = "webpriyanka@2022"
  rights = "ReadWrite"
  storage = "Standard_LRS"
  micsft = "microsoftwindowsserver"
  win = "windowsserver"
  vmwin_versing = "2016-datacenter"
  location = "eastus"
  rg = module.configuration2.rgid
  nic = module.configuration1.nicid
}
module "configuration4" {
  source = "./VNet"
  vnet = "priyankavnet"
  cidr_block = "10.168.0.0/16"
  vsub = "priyankasubnet"
  ip_address = "10.168.2.0/24"
  location = "eastus"
  rg = module.configuration2.rgid
}