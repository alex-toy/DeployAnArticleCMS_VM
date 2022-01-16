################################################################
#DELETE RESOURCES :

#Delete an App Service
az webapp delete `
    --name $WebAppName `
    --resource-group $ResourceGroupName

#Delete an App Service plan
az appservice plan delete `
    --name [App Service Plan Name] `
    --resource-group $ResourceGroupName