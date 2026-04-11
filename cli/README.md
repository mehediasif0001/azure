# ☁️ Azure Administrator CLI Cheat Sheet

This repository contains a curated collection of **Azure CLI** commands designed to help Azure Administrators manage infrastructure efficiently. Use this as a quick reference for the AZ-104 exam or daily DevOps tasks.

---

## 🧭 Navigation
- [Account & Subscriptions](#-1-account--subscription)
- [Resource Groups](#-2-resource-groups-rg)
- [Virtual Machines](#-3-virtual-machines-compute)
- [Networking & NICs](#-4-networking--nics)
- [Storage & Disks](#-5-storage--disks)
- [Pro-Tips](#-pro-tips-for-administrators)

---

## 🔑 1. Account & Subscription
*Manage your login session and active environments.*

| Task | Command |
| :--- | :--- |
| **Login to Azure** | `az login` |
| **List All Subscriptions** | `az account list --output table` |
| **Switch Subscription** | `az account set --subscription <ID-or-Name>` |
| **Show Current User** | `az ad signed-in-user show` |

---

## 📦 2. Resource Groups (RG)
*The fundamental building block for organizing resources.*

```
# List all Resource Groups
az group list -o table

# Create a new Resource Group
az group create --name <rg-name> --location <region-name>

# Delete a Resource Group (Deletes everything inside!)
az group delete --name <rg-name> --no-wait --yes
```


---

## 💻 3. Virtual Machines (Compute)
*Lifecycle and management commands for VM instances.*

### 🚀 Lifecycle Management
- **Start VM:** `az vm start -g <rg> -n <vm-name>`
- **Stop VM (Stay Billed):** `az vm stop -g <rg> -n <vm-name>`
- **Deallocate VM (Stop Billing):** `az vm deallocate -g <rg> -n <vm-name>`
- **Restart VM:** `az vm restart -g <rg> -n <vm-name>`

### 🔍 Inspection & Deletion
```
# List all VMs in current subscription
az vm list -o table

# Get Public IP of a specific VM
az vm list-ip-addresses -g <rg> -n <vm-name> -o table

# Delete VM and its resources
az vm delete -g <rg> -n <vm-name> --yes
```


`az vm delete -g <resource group name> -n <vm name >  `  # delete vm 

`az vm list -o table` # list vm output via table

`az group list -o table` # resource group list . output via table

 list attached nic on VM 
`az vm nic list
  --resource-group <Resource-Group> 
  --vm-name <vm name>` 


