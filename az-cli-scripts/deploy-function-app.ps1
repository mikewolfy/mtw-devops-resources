az login

$resourceGroupName = Read-Host -Prompt 'Enter Resource Group Name:'
$storageAccountName = Read-Host -Prompt 'Enter Storage Account Name:'
$functionAppName = Read-Host -Prompt 'Enter Function App Name:'
$functionAppPlanName = -join ($functionAppName, "-plan")

az group create --name $resourceGroupName --location eastus

az storage account create --name $storageAccountName --location eastus --resource-group $resourceGroupName --sku Standard_LRS

az functionapp plan create --resource-group $resourceGroupName --name $functionAppPlanName --location eastus --number-of-workers 1 --sku EP1 --is-linux

Write-Host "All done!"