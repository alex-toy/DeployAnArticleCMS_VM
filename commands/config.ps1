################################################################
# resource Group :

$Global:MyLocation = "westus2"
"Location : " + $MyLocation

$Global:ResourceGroupName = "cloud-demo"
"Resource group : " + $ResourceGroupName



################################################################
# VM :

$Global:VMName = "linux-vm-west"
"VM name : " + $VMName

$Global:ImageName = "UbuntuLTS"
"Image name : " + $ImageName

$Global:Size = "Standard_B1s"
"Size : " + $Size

$Global:AdminUsername = "alexadmin"
"Admin user name : " + $AdminUsername

$Global:Port = "80"
"Port : " + $Port

$Global:storageSku = "Standard_HDD"
"storageSku : "  + $storageSku



################################################################
# Secret key :

$SSHKeyName = "mySSHKey"
"Secret key name : "  + $SSHKeyName