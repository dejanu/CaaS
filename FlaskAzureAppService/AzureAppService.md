### Links

* https://learn.microsoft.com/en-us/azure/app-service/


* Deploy

```bash

az login
az account set -s "subscription_guid"

# check if is the correct subscription by listing the resource groups
az group list -o table

# Create the webapp, AppServicePlan and other resources, then deploy your code to Azure
az webapp up -n srepage -g demoConf --runtime PYTHON:3.9 --sku B1 -- location westeurope --dryrun

az group delete -n srepage
```