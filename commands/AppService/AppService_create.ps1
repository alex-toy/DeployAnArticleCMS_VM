################################################################
#CREATE AND DEPLOY AN APP SERVICE :

#cd to web directory

#Create and Deploy an App Service Web App:
$Global:WebAppName = "hello-world1234"
"Web app name : " + $WebAppName

$Global:SKU = "F1"
"SKU : " + $SKU

az webapp up 
    --resource-group $ResourceGroupName `
    --name $WebAppName `
    --sku $SKU `
    --verbose

# az webapp up --location <myLocation> --name <myAppName> --html

#update your app, make changes to your code, and then run (Note: this may not update new requirements you may have added):
# az webapp up `
#     --name $WebAppName `
#     --verbose


#Open a browser and navigate to the app URL (http://<myAppName>.azurewebsites.net) and verify the app is running
#$url = "http://" + $WebAppName + ".azurewebsites.net
