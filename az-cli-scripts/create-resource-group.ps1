param(
     [Parameter()]
     [string]$ResourceGroupName,
 
     [Parameter()]
     [string]$Region
 )

 az group create --name $resourceGroupName --location $Region
