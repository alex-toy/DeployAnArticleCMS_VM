################################################################
# resource Group :
#southcentralus centralus francecentral
$Global:RGLocation = "francecentral"
$Global:RGName = "create-vm-RG"
$Global:application_path = "app"
$Global:var_path = "app\var.cfg"

#######################################################################
# Steps :

az group create --name $RGName --location $RGLocation

."commands\SQLServer\SQLServer_create.ps1"

."commands\StorageAccount\StorageAccount_create.ps1"

."commands\StorageAccount\StorageAccount_keys.ps1"

."commands\VirtualMachine\VM_create.ps1"

."commands\VirtualMachine\VM_getIP.ps1"

."commands\VirtualMachine\VM_connect.ps1"