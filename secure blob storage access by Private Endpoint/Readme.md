 Azure Secure Storage Integration (Private Access)

This repository demonstrates how to set up a secure connection between an Azure VM and Azure Blob Storage using private networking and CLI automation.
🏗️ Architecture

    Virtual Machine: Ubuntu 22.04 LTS (devops-vm)

    Storage: Azure Blob Storage (devopsstor23210) with LRS.

    Security: Public Network Access Disabled.

    Connectivity: Private Endpoint  access.

📋 Steps Executed

    Infrastructure Setup: Created a storage account and a private container ( Disabled public network access to the storage account to eliminate external threats. ) in the       East US region. and 
    Create private endpoint to allow trusted communication between the VM and Storage via the Azure backbone network.

    
    Data Operation: - Created a testfile.txt on the Linux VM.

    Uploaded the file using az storage blob upload with account keys.

    Verification: Listed blobs via CLI to confirm successful 100% data integrity.

    
