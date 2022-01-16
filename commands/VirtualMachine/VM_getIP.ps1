$file = '.\commands\VirtualMachine\ip.json'
az vm list-ip-addresses -g $RGName -n $VMName | Out-File $file

$json = Get-Content $file -Raw | ConvertFrom-Json 

#IP address :
$Global:IP = $json.virtualMachine.network.publicIpAddresses.ipAddress
"IP : " + $IP



