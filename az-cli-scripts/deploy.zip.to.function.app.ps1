# https://docs.microsoft.com/en-us/azure/azure-functions/deployment-zip-push

# FIRST: run 'dotnet publish' from the root of your Functions Project directory, 
# SECOND: zip up the output folder, which should have host.json in the root
# THIRD: run this command to deploy to your function app

az login

#az functionapp deployment source config-zip -g "kmx-qa-central-shops-ciam-shared" -n "mycarmax-id-proof-function-svc-qa-central" --src "C:\Users\149036\Downloads\app.zip"

az functionapp deployment source config-zip -g "kmx-dev-east-shops-ciam" -n "mtw-test-func22" --src "C:\Users\149036\Downloads\app.zip"

