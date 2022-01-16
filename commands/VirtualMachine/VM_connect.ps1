################################################################
#CONNECT TO THE VM :

$SSHKeyName = "mySSHKey"
az sshkey create --name $SSHKeyName --resource-group $ResourceGroupName
az sshkey list --resource-group $ResourceGroupName
az sshkey show --name $SSHKeyName --resource-group $ResourceGroupName

#grab the IP address IPADDRESS for a particular VM
az vm list-ip-addresses -g $ResourceGroupName -n $VMName

chmod 400 C:\sources\Udacity\mySSHKey.pem

#copy a basic Flask app from local machine to the VM
scp -r ./path/to/folder/web admin@IPADDRESS:/home/admin
scp -i C:\sources\Udacity\mySSHKey.pem -r FlaskWebProject/ alexadmin@20.112.84.170:/home/alexadmin
scp -r ./ alexadmin@20.112.84.170:/home/alexadmin
$Global:IP = "20.114.45.217" 
$scp = "scp -r ./application " + $AdminUsername + "@" + $IP + ":/home/" + $AdminUsername

#connect to the VM with 
ssh [adminusername]@[IPADDRESS]
$ssh = "ssh -i mySSHKey.pem " + $AdminUsername + "@" + $IP
$ssh = "ssh " + $AdminUsername + "@" + $IP
