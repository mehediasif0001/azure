![SS](https://github.com/mehediasif0001/azure/blob/main/SQL-Database-Migration-and-Setup/image/Gemini_Generated_Image_az6xl8az6xl8az6x.png)

☁️ Azure SQL Migration & Data Recovery Strategy

This repository contains the documentation and implementation details for migrating infrastructure to Azure SQL Database,
configuring Blob Storage for backups, and ensuring a robust Data Recovery process.


## 🚀 Project Overview

The Nautilus DevOps team is performing an incremental migration to Azure. This project demonstrates the setup of a publicly accessible SQL Database,
automated backup exports to Blob Storage, and secure retrieval of backup artifacts.

🛠️ Infrastructure Components

  1. Azure SQL Database Configuration

    Database Name: devops-sqldb

    Server Name: devops-server-32101

    Region: West US

    Hardware: Basic Tier (2 GiB)

    Redundancy: Locally-redundant backup storage (LRS)

  2. Storage Solution

    Storage Account: devopsst26864

    Container: devops-container-17726

📖 Step-by-Step Instructions
  Step 1: Database Provisioning

    Navigate to SQL Databases in the Azure Portal.

    Create a new server named devops-server-32101 in West US.

    Configure the firewall to allow Public Access and ensure "Allow Azure services to access this server" is checked.

    Set the compute tier to Basic with a maximum size of 2 GiB.

Step 2: Backup (Export) Process

To create a portable backup of an Azure SQL Database, we use the Export feature which generates a .bacpac file.

    Go to the devops-sqldb overview page.

    Click Export from the top menu.

    Provide the filename: devops-db-backup.bacpac.

    Select the storage account devopsst26864 and container devops-container-17726.

    Enter the SQL Admin credentials to initiate the export.

Step 3: Secure Backup Retrieval

Once the export is complete, the backup must be downloaded to the client host (azure-client) for local archival or inspection.

On the client host terminal:


# Navigate to the target directory
    cd /opt

# Using Azure CLI to download the artifact
        sudo az storage blob download \
        --account-name devopsst26864 \
        --container-name devops-container-17726 \
        --name devops-db-backup.bacpac \
        --file devops-db-backup.bacpac \
        --auth-mode key

✅ Validation Checklist

    [x] Database State: Verified that devops-sqldb is in the Ready (Online) state.

    [x] Blob Verification: Confirmed devops-db-backup.bacpac exists in the specified container.

    [x] Local Integrity: Verified file download at /opt/devops-db-backup.bacpac on the client host.

  ![SS](https://github.com/mehediasif0001/azure/blob/main/SQL-Database-Migration-and-Setup/image/Screenshot_1.png)
  ![SS](https://github.com/mehediasif0001/azure/blob/main/SQL-Database-Migration-and-Setup/image/Screenshot_2.png)
  ![SS](https://github.com/mehediasif0001/azure/blob/main/SQL-Database-Migration-and-Setup/image/Screenshot_3.png)
  ![SS](https://github.com/mehediasif0001/azure/blob/main/SQL-Database-Migration-and-Setup/image/Screenshot_4.png)

  

🔐 Security Best Practices

    Firewall Rules: Access is restricted to specific IP ranges.

    LRS Redundancy: Ensures data is replicated three times within a single data center for cost-effective protection.

    SAS Tokens: Use Shared Access Signatures (SAS) for time-limited, secure downloads instead of account keys where possible.
