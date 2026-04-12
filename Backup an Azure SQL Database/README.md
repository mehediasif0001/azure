# AZURE SQL DATABASE BACKUP 
**Author:** Mehedi Hasan Asif | **Date:** April 2026

---

## 📊 PROJECT OVERVIEW
This project demonstrates the end-to-end workflow for safeguarding cloud data by exporting an Azure SQL Database to a secure Blob Storage container and performing a local restoration download.

* **Source:** Azure SQL Database `datacenter-db` (Central US)
* **Destination:** Blob Storage `datacenter-container-7806`
* **Client:** azure-client host (`/opt` directory)

---

## 🛠️ STEP 1: PORTAL CONFIGURATION (DATABASE EXPORT)
**To safeguard the data, we first initiate the export process to generate a .bacpac file.**

![image alt](https://github.com/mehediasif0001/azure/blob/main/Backup%20an%20Azure%20SQL%20Database/image/Screenshot_1.png)

* **Action:** Navigate to the SQL database `datacenter-db`.
* **Step:** Select the **Export** option from the top navigation bar.

![image alt](https://github.com/mehediasif0001/azure/blob/main/Backup%20an%20Azure%20SQL%20Database/image/Screenshot_2.png)
* **Configuration:** Set the filename to **datacenter-db-backup**.
* **Target:** Point to storage account **datacenterst18153** and container **datacenter-container-7806**.

![image alt](https://github.com/mehediasif0001/azure/blob/main/Backup%20an%20Azure%20SQL%20Database/image/Screenshot_3.png)
* **Status:** Monitor the 'Request submitted' notification in the Azure Portal.
* **Verification:** Ensure the **.bacpac** file is visible in the storage container after the background process completes.

---

## 💻 STEP 2: TERMINAL LOGS & CLI OPERATIONS
**Once the export is verified in the portal, we transition to the Azure CLI to manage the backup file on the client host.**

![image alt](https://github.com/mehediasif0001/azure/blob/main/Backup%20an%20Azure%20SQL%20Database/image/Screenshot_4.png)

* **Environment Check:** Use `az group list` and `az storage account list` to verify the environment.
* **Target Account:** Confirm **datacenterst18153** is available and status is **available**.

![image alt](https://github.com/mehediasif0001/azure/blob/main/Backup%20an%20Azure%20SQL%20Database/image/Screenshot_5.png)
* **Blob Audit:** List blobs using the CLI to confirm the exact filename and size.
* **Command:** Initiate the `az storage blob download` command targeting the `/opt` folder.

![image alt](https://github.com/mehediasif0001/azure/blob/main/Backup%20an%20Azure%20SQL%20Database/image/Screenshot_6.png)
* **Progress:** The terminal indicates the download has reached **100.0000%**.
* **Result:** The backup file is successfully transferred from the Azure Cloud to the landing host.

![image alt](https://github.com/mehediasif0001/azure/blob/main/Backup%20an%20Azure%20SQL%20Database/image/Screenshot_7.png)

* **Final Check:** Run `ls /opt/` to verify physical presence on the disk.
* **Outcome:** **datacenter-db-backup.bacpac** is confirmed as stored in the target directory.

---

## 🔍 TECHNICAL VERIFICATION LOG
**Final Output Confirmation:**
* **File Name:** `datacenter-db-backup.bacpac`
* **Blob Type:** BlockBlob
* **Content Length:** 2770 bytes
* **Storage Location:** `/opt/`
* **Status:** Recovery File Successfully Downloaded

---

## 💡 BEST PRACTICES FOR DISASTER RECOVERY
* **Verification:** Always check the **Import/Export History** in the SQL Server blade before downloading to ensure data integrity.
* **Redundancy:** Consider **Geo-Redundant Storage (GRS)** for critical backups to protect against regional outages.
* **Automation:** Script these CLI steps into a **cron job** or CI/CD pipeline for recurring backup schedules.

---
**END OF REPOSITORY**
