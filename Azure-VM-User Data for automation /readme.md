# [OVERVIEW]

This technical documentation details the automated deployment of a web infrastructure node for the Nautilus project within Microsoft Azure. The implementation focuses on the provisioning of a Linux-based Virtual Machine (VM) configured to function as a production-grade web server. By utilizing Azure's native `cloud-init` (User Data) capabilities, the deployment achieves a state of "Zero-Touch" configuration, ensuring that the `nginx` service is installed, optimized, and operational immediately upon instance boot.

* **Cloud Provider:** Microsoft Azure
* **Service:** Azure Compute (Virtual Machines)
* **Project Code:** Nautilus-Alpha
* **Infrastructure Goal:** High-availability web hosting with automated service bootstrapping.

---

## [PROBLEM STATEMENT]

### [INCIDENT REPORT: INFRA-SETUP-042]

* **Scenario:** The DevOps team requires a standardized web server instance `datacenter-vm` to support the upcoming deployment phase of a critical application.
* **Requirement:** The instance must be pre-configured with the `nginx` web suite and accessible via public `HTTP` protocols without manual post-provisioning intervention.
* **Technical Impact:** Manual configuration of web servers introduces configuration drift and security inconsistencies. Lack of automated port management (Port 80) prevents immediate service availability.
* **Root Objective:** Automate the installation of `nginx` and the opening of inbound security rules during the resource creation lifecycle.

---

## [CONFIGURATION - GUI ACTIONS]

### [STEP 1: IDENTITY AND PLACEMENT]
* **Action:** Configuration of instance basics and resource grouping.
* **Process:** Assign `Virtual machine name` as `datacenter-vm`. Select the `kml_rg_main` resource group and the `(US) East US` region.
* **Expected Result:** Logical resource isolation and geographic placement are established.
![image](https://github.com/mehediasif0001/azure/blob/main/Nautilus%20Project%20VM/image/Screenshot_1.png)

### [STEP 2: ARCHITECTURE AND COMPUTE SIZE]
* **Action:** Selection of OS Image and Hardware Tier.
* **Process:** Deploy using `Ubuntu Server 24.04 LTS - x64 Gen2`. Select the `Standard_D2s_v3` size (2 vCPUs, 8 GiB memory) to meet the application's performance baseline.
* **Expected Result:** The compute resource is allocated with specific hardware constraints and a verified Linux kernel.
![image](https://github.com/mehediasif0001/azure/blob/main/Nautilus%20Project%20VM/image/Screenshot_2.png)

### [STEP 3: NETWORK SECURITY AND ACCESS]
* **Action:** Firewall and Authentication configuration.
* **Process:** Select `Password` for the authentication type. Under `Inbound port rules`, enable `Allow selected ports` and choose `HTTP (80)`.
* **Expected Result:** Public ingress is permitted for web traffic via the Network Security Group (NSG).
![image](https://github.com/mehediasif0001/azure/blob/main/Nautilus%20Project%20VM/image/Screenshot_3.png)

### [STEP 4: NETWORK INFRASTRUCTURE]
* **Action:** Provisioning of Virtual Network and Public IP.
* **Process:** Create a new Virtual Network `datacenter-vm-vnet` and a dynamic `Public IP` address `datacenter-vm-ip`.
* **Expected Result:** The instance is assigned a routable public entry point for internet-based requests.
![image](https://github.com/mehediasif0001/azure/blob/main/Nautilus%20Project%20VM/image/Screenshot_4.png)

---

## [CLI OPERATIONS]

### [CLOUD-INIT BOOTSTRAP SCRIPT]
The following shell script is injected into the `Advanced > Custom data` field to automate the package management and service lifecycle:

```bash
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
