module "rg_vnet" {
  source  = "../modules/rg"
  rg_name = "rg_final_vnets"
}

module "rg_vm" {
  source  = "../modules/rg"
  rg_name = "rg_final_vm"
}

module "vnet" {
  count     = var.count_value
  source    = "../modules/vnet"
  cidr_vnet = "10.${count.index + 1}0.0.0/var.count_value4"
  vnet_name = "VNet_0${count.index}"
  vnet_rg   = module.rg_vnet.out_rg_name
}

module "snet" {
  count     = var.count_value
  source    = "../modules/snet"
  cidr_snet = "10.${count.index + 1}0.0.0/var.count_value5"
  snet_name = "SNet0${count.index}"
  snet_rg   = module.rg_vnet.out_rg_name
  vnet_name = module.vnet[count.index].vnet_name
}


module "nic" {
  count     = var.count_value
  source    = "../modules/nic"
  nic_name  = "nic-vm0${count.index}"
  rg_nic    = module.rg_vm.out_rg_name
  location  = module.rg_vm.out_rg_location
  ip_name   = "ip_vm0${count.index}"
  subnet_id = module.snet[count.index].out_snet_id
  pip_id = module.pip[count.index].out_pip
}

module "vm" {
  count    = var.count_value
  source   = "../modules/vm"
  location = module.rg_vm.out_rg_location
  vm_name  = "vm-final0${count.index}"
  nic_id   = module.nic[count.index].nic_id
  rg_vm    = module.rg_vm.out_rg_name
}

module "nsg" {
  count                 = var.count_value
  source                = "../modules/nsg"
  location              = module.rg_vm.out_rg_location
  nsg_name              = "nsg_snet0${count.index}"
  rg_nsg                = module.rg_vm.out_rg_name
  nsg_associate_snet_id = module.snet[count.index].out_snet_id
}

module "pip" {
  count    = var.count_value
  source   = "../modules/pip"
  pip_name = "pip_vm0${count.index}"
  rg_pip   = module.rg_vnet.out_rg_name
  location = module.rg_vnet.out_rg_location
}



