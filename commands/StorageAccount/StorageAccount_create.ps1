################################################################
#Create the block blob storage account :

az storage account create 
    --resource-group az204-blob-rg 
    --name <myStorageAcct> 
    --location <myLocation> 
    --kind BlockBlobStorage 
    --sku Premium_LRS

