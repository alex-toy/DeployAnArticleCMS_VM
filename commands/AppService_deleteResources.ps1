################################################################
#DELETE RESOURCES :

#Delete an App Service
az webapp delete `
    --name hello-world1234 `
    --resource-group resource-group-west

#Delete an App Service plan
az appservice plan delete `
    --name [App Service Plan Name] `
    --resource-group resource-group-west