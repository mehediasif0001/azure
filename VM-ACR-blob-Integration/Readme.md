🚀 Azure Container Registry, VM, and Blob Storage Integration

This repository documents the end-to-end integration of a containerized Flask application with Azure cloud services. The project covers image orchestration, secure cloud storage, and automated deployment on an Azure Virtual Machine.
📁 Project Architecture

    Azure Container Registry (ACR):  storage for Docker images.

    Azure Virtual Machine (VM): Ubuntu-based compute host running Docker.

    Azure Blob Storage: Decoupled storage for application configuration (config.json).

    Docker Volume Mounting: Injecting cloud-stored configuration into the runtime container.

🛠️ Step-by-Step Implementation
Phase 1: Azure Container Registry (ACR) Setup

Build and push the application image to a private registry.
    	
  Create ACR
    
    az acr create --resource-group <RG_NAME> --name xfusionacr25580 --sku Basic
   ACR Login
   
    az acr login --name xfusionacr25580
    
Build Image	
    
    docker build -t xfusionacr25580.azurecr.io/xfusion/python-app:latest ./pyapp


Push Image	
    
    docker push xfusionacr25580.azurecr.io/xfusion/python-app:latest

Phase 2: Cloud Storage Configuration

Store the application configuration file securely in Azure Blob Storage.

Create Storage Account
    
    az storage account create --name xfusionstor25580 --resource-group <RG_NAME> --location eastus --sku Standard_LRS

Create Container	
    
    az storage container create --name xfusion-config --account-name xfusionstor25580
    
Upload Config File	
    
    az storage blob upload --account-name xfusionstor25580 --container-name xfusion-config --name config.json --file /root/config.json
Phase 3: Virtual Machine (VM) Provisioning

Prepare the Ubuntu VM for container hosting.


# 1. Update system and install required tools
    
    sudo apt update && sudo apt install docker.io  -y
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# 2. Enable and start Docker service
    
    sudo systemctl start docker
    sudo systemctl enable docker

# 3. Authenticate VM with ACR (Using Admin Credentials from Portal)
    
    sudo docker login xfusionacr25580.azurecr.io --username xfusionacr25580 --password <ACR_PASSWORD>



Step 1: Download the config file from Blob to VM host
Bash

    az storage blob download \
        --account-name xfusionstor25580 \
        --container-name xfusion-config \
        --name config.json \
        --file /home/azureuser/config.json \
        --account-key <key>

Step 2: Run the Docker Container with Volume Mount
Bash
    
    sudo docker run -d -p 80:80 \
        -v /home/azureuser/config.json:/app/config.json \
        xfusionacr25580.azurecr.io/xfusion/python-app:latest

✅ Verification & Monitoring

Use these commands to verify the health of the deployment:
Bash

# Check if the container is running
    
    sudo docker ps

# Inspect logs to verify the Flask application status
    
    sudo docker logs <CONTAINER_ID>

# Test the local response via terminal
    
    curl localhost:80
