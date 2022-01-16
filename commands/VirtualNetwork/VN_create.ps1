az network vnet subnet list `
  -g $ResourceGroupName `
  --vnet-name linux-vm-westVNET


az network vnet subnet show `
    -g $ResourceGroupName `
    -n linux-vm-westVNET `
    --vnet-name linux-vm-westSubnet