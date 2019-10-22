#!/usr/bin/env bash

#You'll need to log into Azure first 'sudo az acr login'
cd docker
sudo az acr login --name vangoscontainerregistry
sudo docker login vangoscontainerregistry.azurecr.io -u vangoscontainerregistry -p $AZURE_CONTAINER_KEY  #use container username and access key
sudo docker build -t vangoscontainerregistry.azurecr.io/ita-dataloader .
sudo docker push vangoscontainerregistry.azurecr.io/ita-dataloader

#FYI: Registry credentials are autogenerated and can be procured from portal.azure.com
# sudo docker login
 sudo az container delete --resource-group vangos-resources --name ita-dataloader --yes
 sudo az container create --resource-group vangos-resources --name ita-dataloader \
     --image vangoscontainerregistry.azurecr.io/ita-dataloader:latest --dns-name-label ita-dataloader --ports 80 \
     --location eastus --registry-username vangoscontainerregistry --registry-password $AZURE_CONTAINER_KEY \
     --environment-variables 'AZURE_STORAGE_ACCOUNT'=$AZURE_STORAGE_ACCOUNT \
      'AZURE_STORAGE_ACCOUNT_KEY'=$AZURE_STORAGE_ACCOUNT_KEY \
      'DATAFACTORY_STATUS_URL'=$DATAFACTORY_STATUS_URL \
      'FLYWAY_URL'=$FLYWAY_URL \
      'FLYWAY_USER'=$FLYWAY_USER \
      'FLYWAY_PASSWORD'=$FLYWAY_PASSWORD \
      'TARIFF_DOCS_ACCESS_TOKEN_URL'=$TARIFF_DOCS_ACCESS_TOKEN_URL \
      'TARIFF_DOCS_CLIENT_ID'=$TARIFF_DOCS_CLIENT_ID \
      'TARIFF_DOCS_CLIENT_SECRET'=$TARIFF_DOCS_CLIENT_SECRET \
      'TARIFF_DOCS_METADATA_URL'=$TARIFF_DOCS_METADATA_URL

#az container logs --resource-group vangos-resources --name ita-dataloader

cd ..
