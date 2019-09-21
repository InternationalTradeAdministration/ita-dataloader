# SUSA Stats Dataloader
A tool that helps import (stage) data for reporting purposes

## APIs
- /api/config: Displays configuration urls
- /api/save-data: Saves data sources to storage
- /api/storage-content-url: Returns a url that returns a list of all files in storage
- /api/storage-content: Returns a list of urls to the files in storage

## Build
```./build.sh```

## Deploy
```./deploy.sh```

## Production Deployment Notes
 - An Azure Blob Storage account needs to exist
 - An Azure AD App Registration needs to be made to procure an OAuth Client ID and Client Secret
 - A MS SQL Server Database needs to exist with a stub named select_usa
 - The following environment variables need to exist:
    - AZURE_OAUTH_CLIENT_ID: Active Directory Client ID
    - AZURE_OAUTH_CLIENT_SECRET: Active Directory Client Secret
    - AZURE_STORAGE_ACCOUNT: Data Lake Storage Account
    - AZURE_STORAGE_ACCOUNT_KEY: Data Lake Storage Account Key
    
## General Notes
 - The data-pipeline directory is not utilized in this project, it's a temporary backup of the Azure data-pipeline
 - Flyway does not yet work with Azure SQL Data Warehouse; so the scripts need to be manually executed for the data pipeline to work