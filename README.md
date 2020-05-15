# mtw-devops-resources
Tools that are helpful with building, automating, testing, &amp; deploying

## Azure CLI Commands for Deploying Functions in Container

The [script for deploying a function hosting a container](./az-cli-scripts/interactive-deploy-function-app.ps1) script
will build out a resource group, storage, and function app that can host a container that you publish to Docker Hub.  It
was generated as I completed the following walkthough:

[Microsoft Walkthough - Containerized Functions](https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-function-linux-custom-image?tabs=bash%2Cportal&pivots=programming-language-csharp)
