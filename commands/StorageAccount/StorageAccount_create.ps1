"###############################################################"
"Now running : " + $MyInvocation.MyCommand.Path
"###############################################################"


################################################################
# Storage Account :

$Global:SAName = "flaskstorageaccount"
#southcentralus centralus francecentral
$Global:SALocation = $RGLocation
$Global:SAKind = "BlockBlobStorage"
$Global:SASKU = "Standard_LRS"
$Global:SCName = "flask-images"
$Global:SCAuthMode = "login"
$Global:SCPublicAccess = "container"



#######################################################################
"Set config file :"

$file = $var_path
(Get-Content -Path $file) | ForEach-Object { 
    if($_.split("=")[0] -like 'BLOB*') {
        $new = $_.split("=")[0]; $new
    } else {
        $_
    }
} | Set-Content -Path $file

(Get-Content -Path $file) | ForEach-Object { $rep = 'BLOB_ACCOUNT=' + $SAName; $_ -Replace 'BLOB_ACCOUNT', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'BLOB_CONTAINER=' + $SCName; $_ -Replace 'BLOB_CONTAINER', $rep } | Set-Content -Path $file



################################################################
#Create the block blob storage account :

az storage account create `
    --resource-group $RGName `
    --name $SAName `
    --location $SALocation 
    #--kind $SAKind `
    #--sku $SASKU


################################################################
#Create the container :

az storage container create `
 --account-name $SAName `
 --name $SCName `
 --auth-mode $SCAuthMode `
 --public-access $SCPublicAccess


#######################################################################
# Next step :

"Now run : commands\StorageAccount\StorageAccount_keys.ps1"


