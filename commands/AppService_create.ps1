################################################################
#SIGN IN TO AZURE :

az login


################################################################
#CREATE AND DEPLOY AN APP SERVICE :

#cd to web directory

#Create and Deploy an App Service Web App:
az webapp up --resource-group resource-group-west `
    --name hello-world1234 `
    --sku F1 `
    --verbose

#If you visit the URL, you should see your site deployed.

#update your app, make changes to your code, and then run (Note: this may not update new requirements you may have added):
az webapp up `
    --name hello-world1234 `
    --verbose



