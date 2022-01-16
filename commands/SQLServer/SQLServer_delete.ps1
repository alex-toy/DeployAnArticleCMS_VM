################################################################
#DELETE RESOURCES :

#Delete DB
az sql db delete \
    --name hello-world-db \
    --resource-group resource-group-west \
    --server hello-world-server \
    --verbose

#Delete SQL Server
az sql server delete \
    --name hello-world-server \
    --resource-group resource-group-west \
    --verbose