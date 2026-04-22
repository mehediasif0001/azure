# 🐳 Deploy PHP Container Application via ACR & App Service

 This project demonstrates the end-to-end process of containerizing a PHP 8.2 application, 
hosting the image in Azure Container Registry (ACR), and deploying it as a managed service using Azure App Service (Linux).

🏗️ Step-by-Step Implementation
## 1. Create an Azure Container Registry (ACR)

    Portal: Navigated to Container registries > Create.

        Registry Name: devopsacr8690

        Region: Central US

        SKU: Basic

    Crucial: After deployment, enabled the Admin user under the Access keys settings.

 ![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_1.png)
 ![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_2.png)

Why? : ACR is our private library for Docker images. Enabling the Admin user provides the necessary credentials (Username/Password)
so that the App Service can pull the private image.

![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_3.png)

# 2. Build and Push the Image (CLI Operations)

    CLI: Performed all Docker operations on the azure-client host.


    cd /root/webapp
    vi Dockerfile
    
![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_9.png)
# Create the optimized Dockerfile

      FROM php:8.2-apache
      COPY . /var/www/html/
      EXPOSE 80

![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_5.png)
# Login to the Registry
    az acr login --name devopsacr8690

# Build and Tag the image

    docker build -t devopsacr8690.azurecr.io/php-app:v1 .
![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_6.png)

# Push the image to ACR

    docker push devopsacr8690.azurecr.io/php-app:v1

Why? : We use php:8.2-apache because the built-in Apache server keeps the container running persistently. Using az acr login ensures a secure authenticated tunnel for pushing the image.
![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_7.png)
![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_8.png)
## 3. Create an Azure App Service

    Portal: Created a Web App with the following configuration:

        Publish: Container

        Operating System: Linux

        Region: Central US

        Plan: Basic B1

    Docker Setup: Selected Azure Container Registry as the source and linked it to the devopsacr8690 registry.

Why? : App Service for Containers (Linux) is a PaaS solution that runs Dockerized apps without managing the underlying VM. We use the B1 plan to balance performance and cost for this lab.

![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_11.png)
![SS](https://github.com/mehediasif0001/azure/blob/main/Deploy%20PHP%20Container%20Application%20via%20ACR%20%26%20App%20Service/images/Screenshot_10.png)

4. Verification and Troubleshooting

    Portal: Accessed the Default domain URL from the App Service overview.

    Troubleshooting: Used WEBSITES_PORT = 80 in Environment variables to ensure Azure correctly maps the container's internal port.

Why? : Verification confirms that the App Service has successfully performed the "Pull" operation from ACR and the web application is responding to HTTP requests.

