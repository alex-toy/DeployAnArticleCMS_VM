################################################################
#DELETE A VM :

az vm delete `
   --resource-group $ResourceGroupName `
   --name $VMName `
    --yes