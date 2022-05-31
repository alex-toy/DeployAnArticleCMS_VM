$keyfile = '.\keys.json'
az ad sp create-for-rbac `
    --role Contributor `
    --scopes /subscriptions/af783b88-9530-433e-9520-32a8accf75a5 `
    --query "{ client_id: appId, client_secret: password, tenant_id: tenant }" | Out-File $keyfile
$Global:credentials = Get-Content $keyfile -Raw | ConvertFrom-Json 

$subscriptionfile = '.\subscription.json'
az account show --query "{ subscription_id: id }" | Out-File $subscriptionfile
$Global:subscription_id = (Get-Content $subscriptionfile -Raw | ConvertFrom-Json).subscription_id

$demofile = '.\demo.json'
$myJson = Get-Content $demofile -Raw | ConvertFrom-Json 
$myJson.variables.client_id = $credentials.client_id
$myJson.variables.client_secret = $credentials.client_secret



#######################################################################
"Set config file :"

$file = $var_path
(Get-Content -Path $file) | ForEach-Object { 
    if($_.split("=")[0] -like 'CLIENT_*') {
        $new = $_.split("=")[0]; $new
    } else {
        $_
    }
} | Set-Content -Path $file

(Get-Content -Path $file) | ForEach-Object { $rep = 'CLIENT_SECRET=' + $SQLServerName; $_ -Replace 'CLIENT_SECRET', $rep } | Set-Content -Path $file
(Get-Content -Path $file) | ForEach-Object { $rep = 'CLIENT_ID=' + $SQLBDName; $_ -Replace 'CLIENT_ID', $rep } | Set-Content -Path $file
