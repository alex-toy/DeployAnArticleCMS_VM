#List the address and ports to connect to VM instances in a scale set :
az vmss list-instance-connection-info `
  --resource-group $ResourceGroupName `
  --name $VMName