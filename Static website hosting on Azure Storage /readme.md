🌐 Azure Static Website Hosting & Public Portal Deployment

This project demonstrates how to host a cost-effective static website using Azure Blob Storage. It covers the end-to-end process from provisioning storage to configuring public access and deploying content via Azure CLI.

🏗️ Project Architecture

    Service: Azure Blob Storage (Static Website Hosting feature)

    Container: $web (Special container for web assets)

    Networking: Public Access Enabled for external reach.

    Deployment: Automated via Azure CLI.

📋 Task Requirements & Execution
1. Provisioning Storage Account

Created a storage account named datacenterwebst1398 within the Azure infrastructure to serve as the backend for the information portal.
2. Enabling Static Website Hosting

Configured the storage service to act as a web server by enabling the static website feature and setting index.html as the default entry point.

3. Networking & Public Access

       Configured Public Network Access to Enabled.

       Adjusted Blob Anonymous Access settings to allow external users to view the site without authentication.



5. CLI Deployment

Automated the upload of the web assets from the local environment to the Azure storage 
# Uploading to the special $web container (using single quotes to handle shell variables)
      az storage blob upload \
      --account-name datacenterwebst1398 \
      --container-name '$web' \
      --file index.html \
      --name index.html

![SS](https://github.com/mehediasif0001/azure/blob/main/Static%20website%20hosting%20on%20Azure%20Storage%20/image/Screenshot_1.png)
![SS](https://github.com/mehediasif0001/azure/blob/main/Static%20website%20hosting%20on%20Azure%20Storage%20/image/Screenshot_2.png)
![SS](https://github.com/mehediasif0001/azure/blob/main/Static%20website%20hosting%20on%20Azure%20Storage%20/image/Screenshot_3.png)
![SS](https://github.com/mehediasif0001/azure/blob/main/Static%20website%20hosting%20on%20Azure%20Storage%20/image/Screenshot_4.png)
![SS](https://github.com/mehediasif0001/azure/blob/main/Static%20website%20hosting%20on%20Azure%20Storage%20/image/Screenshot_5.png)
![SS](https://github.com/mehediasif0001/azure/blob/main/Static%20website%20hosting%20on%20Azure%20Storage%20/image/Screenshot_6.png)
![SS](https://github.com/mehediasif0001/azure/blob/main/Static%20website%20hosting%20on%20Azure%20Storage%20/image/Screenshot_7.png)




✅ Validation
![SS](https://github.com/mehediasif0001/azure/blob/main/Static%20website%20hosting%20on%20Azure%20Storage%20/image/Screenshot_8.png)

    The deployment was verified by accessing the Primary Static Website Endpoint. The portal successfully served the index.html content to external browsers.



