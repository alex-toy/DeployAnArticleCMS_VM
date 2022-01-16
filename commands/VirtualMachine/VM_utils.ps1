#Reset password
az vm user update `
  -n $VMName `
  -g $ResourceGroupName `
  -u $AdminUsername `
  -p ""