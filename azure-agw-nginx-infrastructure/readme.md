# 🌐 Complete Configuration: Azure AGW & Nginx Web Server

![SS](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_19.png)

This documentation provides the exact configuration parameters used to build a secure, load-balanced web environment on Azure.
🏗️ Step 1: Network Security Group (NSG) Configuration

    Name: datacenter-nsg
    
    Resource Group: kml_rg_main-f2aa133598bc4445
    
 Inbound Security Rules: 
 
    Priority: 100

    Name: Allow-HTTP

    Port: 80

    Protocol: TCP

    Source: Any

    Destination: Any

    Action: Allow

Why? : This specific rule ensures that the Nginx web server can receive traffic from the Application Gateway. Without this, the Gateway would report the backend as "Unhealthy".

## 🏗️ Step 2: Virtual Network & Subnet Setup

VNet Name: datacenter-vnet

Subnet 1 (For VM): * Name: default (private)

    Address Range: <CIDR Range>

Subnet 2 (For App Gateway): * Name: agw-subnet

    Address Range: <CIDR Range>

Why? : Application Gateway requires a dedicated subnet. We avoided the name GatewaySubnet as it is reserved for VPN Gateways. Isolation ensures that management traffic for the Gateway does not interfere with the VM.
## 🏗️ Step 3: Virtual Machine (VM) Configuration
      
      Name: datacenter-vm
      
      Image: Ubuntu 22.04 LTS
      
      Size: Standard_B1s (1 vCPU, 1 GiB memory)
      
      Disk: Standard SSD
      
      Authentication: * Type: SSH Public Key

    Key: Pasted from ~/.ssh/id_rsa.pub
Network:

    vnet
    private subnet
    no public IP 
    
Management (User Data Script): 
    
    #!/bin/bash
    sudo apt update
    sudo apt install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx


**Why? :** The `Standard_B1s` size is cost-effective for testing. The **User Data** script automates the installation of Nginx, 
making the VM a functional web server immediately upon deployment.

---

### 🏗️ Step 4: Application Gateway (AGW) Configuration
    Name: `datacenter-agw`  
    Tier: Standard V2  
    Public IP Name: `datacenter-agw-ip`  

Backend Pool: 

    Name: `datacenter-backendpool`  
      Target: `datacenter-vm` (Private IP: x.x.x.x)  
          
    HTTP Settings:
      Name: `datacenter-http-settings`  
      Port: 80  
      Protocol:HTTP  

Listener:
    
      Name: `datacenter-listener`  
      Frontend IP: Public  
      Port: 80  
      Protocol: HTTP  
    
   Routing Rule: 
   
        Name: `datacenter-routing-rule`  
        Association: Listener -> HTTP Settings -> Backend Pool  

**Why? :** This configuration sets up a Layer 7 load balancer. It listens for requests on the public IP and routes them to the private Nginx server, 
providing an extra layer of security and high availability.

# ScreenShot:

![SS1](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_1.png)
![SS2](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_2.png)
![SS3](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_3.png)
![SS4](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_4.png)
![SS5](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_5.png)
![SS6](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_6.png)
![SS7](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_7.png)
![SS8](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_8.png)
![SS9](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_9.png)
![SS10](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_10.png)
![SS11](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_11.png)
![SS12](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_12.png)
![SS13](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_13.png)
![SS14](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_14.png)
![SS15](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_15.png)
![SS16](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_16.png)
![SS17](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_17.png)
![SS18](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_18.png)

![SS20](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_20.png)
![SS21](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_21.png)
![SS22](https://github.com/mehediasif0001/azure/blob/main/azure-agw-nginx-infrastructure/imgs/Screenshot_22.png)
