az login
az account set --subscription "<Subscription Name>"
$deployments = az deployment group list --resource-group "<group name>"

$first = true;

foreach($deployment in $deployments)
{
  Write-Host $deployment.Name + ", " + $deployment.ProvisioningState

  if ($first)
  {
    Write-Host $deployment
    first = false
  }
}
