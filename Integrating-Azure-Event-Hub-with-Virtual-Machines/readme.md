🚀 Azure Event Hubs: Centralized Log Streaming from Linux VM

This project demonstrates how to integrate an Azure Virtual Machine with Azure Event Hubs for real-time, centralized log collection. By leveraging the Standard Tier capabilities like Auto-inflate and Partitioning, this architecture ensures high-speed data ingestion and scalability.
🏗️ Architecture Overview

The system consists of a Python-based Producer running on a Linux VM that streams logs to a high-scale Ingestion Service (Azure Event Hubs).

    Producer: Ubuntu VM (nautilus-vm) running Python 3.10.

    Ingestion: Azure Event Hubs Namespace (nautilus-namespace).


🛠️ Infrastructure Configuration Details
1. Event Hubs Namespace (nautilus-namespace)
   
    
        Region: East US (eastus)
    
        Pricing Tier: Standard
    
        Throughput Units (Capacity): 1 (Base)
    
        Auto-Inflate: Enabled (Max Limit: 5 TUs)
    
        TLS Version: 1.2 (Minimum)
    
        Zone Redundancy: Enabled (For High Availability)

3. Event Hub Entity (nautilus-hub)
       
    
        Partition Count: 3 (Parallel data processing streams)
    
        Message Retention: 1 Day (24 hours)
    
        Cleanup Policy: Delete (Standard behavior for event streams)
    
        Status: Active

🚀 Implementation Steps
## Step 1: Resource Provisioning

Deployed the Event Hubs Namespace and the specific Hub via the Azure Portal.
Enabled Auto-inflate to ensure the namespace can handle sudden spikes in log volume without manual intervention.

## Step 2: Security & Connectivity

Configured a Shared Access Policy (SAS) named my-policy with Send permissions. This generated the required Connection String used by the backend VM to authenticate securely without exposing the entire namespace.

## Step 3: Producer Configuration (Python)

Integrated the VM with Event Hubs using the azure-eventhub Python SDK. The script send_logs.py handles the batching of log entries for efficient transmission.


# # 📊 Performance & Monitoring

Verification was performed using Azure Portal Metrics. The spikes in the Incoming Messages and Requests charts confirm successful data transmission.

    Total Successful Requests: Tracked via the Successful Requests metric.

    Data Volume: Monitored via Throughput (Incoming Bytes).

    Reliability: 0% Server Errors recorded during the data streaming phase.

![SS1](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_1.png)
![SS2](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_2.png)
![SS3](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_3.png)
![SS4](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_4.png)
![SS5](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_5.png)
![SS6](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_6.png)
![SS7](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_7.png)
![SS8](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_8.png)
![SS9](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_9.png)
![SS10](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_10.png)
![SS11](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_11.png)
![SS12](https://github.com/mehediasif0001/azure/blob/main/Integrating-Azure-Event-Hub-with-Virtual-Machines/imgs/Screenshot_12.png)
