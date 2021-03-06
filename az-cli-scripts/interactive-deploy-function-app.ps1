﻿#https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-function-linux-custom-image?tabs=bash%2Cportal&pivots=programming-language-csharp

az login

$ResourceGroupName = Read-Host -Prompt 'Enter Resource Group Name:'
$StorageAccountName = Read-Host -Prompt 'Enter Storage Account Name:'
$FunctionAppName = Read-Host -Prompt 'Enter Function App Name:'
$FunctionContainerImageName = Read-Host -Prompt 'Enter Your Function Image Name:'

$FunctionAppPlanName = -join ($functionAppName, "-plan")

$Region = "eastus"

$script = "$PSScriptRoot\create-resource-group.ps1"
& $script -ResourceGroupname $ResourceGroupName -Region $Region

$script = "$PSScriptRoot\create-storage.ps1"
&  $script -ResourceGroupname $ResourceGroupName -Region $Region -StorageAccountName $StorageAccountName

#Write-Host "Creating Function App Plan"
#az functionapp plan create --resource-group $ResourceGroupName --name $FunctionAppPlanName --location eastus --sku Y1

Write-Host "Creating Function App"
# Function with specified plan
#az functionapp create --name $FunctionAppName --storage-account $StorageAccountName --resource-group $ResourceGroupName --plan $FunctionAppPlanName --functions-version 2

# Function with Consumption Plan
az functionapp create --name $FunctionAppName --storage-account $StorageAccountName --resource-group $ResourceGroupName --consumption-plan-location $Region --functions-version 2

#--deployment-container-image-name $FunctionContainerImageName 

Write-Host "Getting storage connection string"
$StorageString = az storage account show-connection-string --resource-group $ResourceGroupName --name $StorageAccountName --query connectionString --output tsv

Write-Host $StorageString

az functionapp config appsettings set --name $FunctionAppName --resource-group $ResourceGroupName --settings AzureWebJobsStorage=$StorageString

Write-Host "All done!"