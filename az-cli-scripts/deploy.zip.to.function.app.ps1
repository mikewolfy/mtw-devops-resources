## FIRST: run 'dotnet publish' from the root of your Functions Project directory, 
## SECOND: zip up the output folder, which should have host.json in the root
## THIRD: run this command to deploy to your function app

az login

az functionapp deployment source config-zip -g "func222-rg" -n "func-name-987" --src "<<Path to Zip>>"