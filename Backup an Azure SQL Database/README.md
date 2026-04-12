## AZURE SQL DATABASE BACKUP & DISASTER RECOVERY AUTOMATION
## Author: Mehedi Hasan Asif | Date: April 2026

## ==========================================================
## 📊 PROJECT OVERVIEW
## ==========================================================
## This project demonstrates the end-to-end workflow for safeguarding 
## cloud data by exporting an Azure SQL Database to a secure Blob 
## Storage container and performing a local restoration download.

## * **Source:** Azure SQL Database 'datacenter-db' (Central US)
## * **Destination:** Blob Storage 'datacenter-container-7806'
## * **Client:** azure-client host (/opt directory)

## ==========================================================
## 🛠️ STEP 1: PORTAL CONFIGURATION (DATABASE EXPORT)
## ==========================================================
## **To safeguard the data, we first initiate the export process to generate a .bacpac file.**

<attach Screenshot_1.png>
## * **Action:** Navigate to the SQL database 'datacenter-db'.
## * **Step:** Select the **Export** option from the top navigation bar.

<attach Screenshot_2.png>
## * **Config:** Set the filename to **datacenter-db-backup**.
## * **Target:** Point to storage account **datacenterst18153** and container **datacenter-container-7806**.

<attach Screenshot_3.png>
## * **Status:** Monitor the 'Request submitted' notification.
## * **Verification:** Ensure the **.bacpac** file is visible in the storage container after completion.

## ==========================================================
## 💻 STEP 2: TERMINAL LOGS & CLI OPERATIONS
## ==========================================================
## **Once the export is verified, we transition to the Azure CLI to manage the backup file on the client host.**

<attach Screenshot_4.png>
## * **Environment Check:** Use `az group list` and `az storage account list` to verify the environment.
## * **Target Account:** Confirm **datacenterst18153** is available and active.

<attach Screenshot_5.png>
## * **Blob Audit:** List blobs to confirm the exact filename.
## * **Command:** Initiate the `az storage blob download` command.

<attach Screenshot_6.png>
## * **Progress:** The download reaches **100.0000%**.
## * **Result:** The backup file is successfully transferred to the landing host.

<attach Screenshot_7.png>
## * **Final Check:** Run `ls /opt/` to verify physical presence.
## * **Outcome:** **datacenter-db-backup.bacpac** is confirmed in the target directory.

## ==========================================================
## 🔍 TECHNICAL VERIFICATION LOG
## ==========================================================
## **Final Output Confirmation:**
## * **File Name:** datacenter-db-backup.bacpac
## * **Blob Type:** BlockBlob
## * **Content Length:** 2770 bytes
## * **Storage Location:** /opt/
## * **Status:** Recovery File Successfully Downloaded

## ==========================================================
## 💡 BEST PRACTICES FOR DISASTER RECOVERY
## ==========================================================
## * **Verification:** Always check the **Import/Export History** before downloading to ensure data integrity.
## * **Redundancy:** Consider **Geo-Redundant Storage (GRS)** for critical backups to protect against regional outages.
## * **Automation:** Script these CLI steps into a **cron job** or pipeline for recurring backup schedules.

## ==========================================================
## END OF DOCUMENT
## ==========================================================
