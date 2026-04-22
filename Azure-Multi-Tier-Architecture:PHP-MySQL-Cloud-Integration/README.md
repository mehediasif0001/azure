Project Overview:


This repository contains the documentation and architectural overview of a Two-Tier Cloud Application deployed on Microsoft Azure. The project demonstrates the integration of a frontend PHP application with a backend MySQL database across different Azure regions.
🏗️ Architecture Overview

The setup consists of two main components:

    Application Tier: A PHP application hosted on an Azure VM in the East US region.

    Database Tier: A MySQL database (Jetware Image) hosted on an Azure VM in the Central US region.

🛠️ Tech Stack

    Cloud Provider: Microsoft Azure

    Programming: PHP

    Database: MySQL (Marketplace Image)

    Infrastructure Management: Azure CLI & Azure Portal

📋 Key Features & Implementations
1. Automated Resource Provisioning

Used Azure CLI to automate the creation of Virtual Machines, ensuring consistency across environments.
Bash

1. VM create for Mysql DB

2. Networking & Security

    NSG Configuration: Orchestrated Network Security Group (NSG) rules to open Port 3306 for secure database handshakes.

    Cross-Region Connectivity: Established communication between East US and Central US via Public IP/Internet endpoints.

3. Database Administration

    Created DB 

    Managed user privileges using GRANT ALL PRIVILEGES to allow remote connections only from the application tier.

4. Application Integration

    Developed a PHP connection script (db_test.php) to validate real-time database connectivity.

    Successfully achieved a "Connected successfully" status, confirming end-to-end integration.

![Screenshot](https://github.com/mehediasif0001/azure/blob/main/Azure%20Multi-Tier%20Architecture%3A%20PHP-MySQL%20Cloud%20Integration/image/Screenshot_1.png)
![Screenshot](https://github.com/mehediasif0001/azure/blob/main/Azure%20Multi-Tier%20Architecture%3A%20PHP-MySQL%20Cloud%20Integration/image/Screenshot_2.png)
![Screenshot](https://github.com/mehediasif0001/azure/blob/main/Azure%20Multi-Tier%20Architecture%3A%20PHP-MySQL%20Cloud%20Integration/image/Screenshot_3.png)
![Screenshot](https://github.com/mehediasif0001/azure/blob/main/Azure%20Multi-Tier%20Architecture%3A%20PHP-MySQL%20Cloud%20Integration/image/Screenshot_4.png)
![Screenshot](https://github.com/mehediasif0001/azure/blob/main/Azure%20Multi-Tier%20Architecture%3A%20PHP-MySQL%20Cloud%20Integration/image/Screenshot_5.png)
![Screenshot](https://github.com/mehediasif0001/azure/blob/main/Azure%20Multi-Tier%20Architecture%3A%20PHP-MySQL%20Cloud%20Integration/image/Screenshot_6.png)
![Screenshot](https://github.com/mehediasif0001/azure/blob/main/Azure%20Multi-Tier%20Architecture%3A%20PHP-MySQL%20Cloud%20Integration/image/Screenshot_7.png)
![Screenshot](https://github.com/mehediasif0001/azure/blob/main/Azure%20Multi-Tier%20Architecture%3A%20PHP-MySQL%20Cloud%20Integration/image/Screenshot_8.png)
![Screenshot](https://github.com/mehediasif0001/azure/blob/main/Azure%20Multi-Tier%20Architecture%3A%20PHP-MySQL%20Cloud%20Integration/image/Screenshot_9.png)
