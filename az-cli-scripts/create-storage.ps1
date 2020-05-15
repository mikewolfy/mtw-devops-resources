param(
     [Parameter()]
     [string]$ResourceGroupName,
 
     [Parameter()]
     [string]$Region,

     [Parameter()]
     [string]$StorageAccountName
 )

az storage account create --name $StorageAccountName --location $Region --resource-group $resourceGroupName --sku Standard_LRS

Write-Host "Storage Account Created"