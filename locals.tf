locals {
    #Debe ser único, ejemplo, alias = "jyapur"
    company = "BancoPichincha"
    alias = ""
    #ejemplo, region = "East US 2"
    region = "East US"
    #az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<subscriptionID>/resourceGroups/<resourceGroupName>"
    #areas
    area = "HomeBanking"
    networking = "Networking"
    #ambientes
    development = "Development"
    production = "Production"

    development-short = "dev"
    production-short = "prod"


}

