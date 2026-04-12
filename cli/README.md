# ☁️ AZURE ADMINISTRATOR & SOLUTIONS ARCHITECT: MASTER CLI CHEAT SHEET
# Author: Nautilus DevOps | Date: 2026

# ==========================================================
# 🚀 MODULE 1: ACCOUNT & SUBSCRIPTION MANAGEMENT
# ==========================================================
# Login to Azure
`az login`

# List all subscriptions and find your Tenant ID
`az account list -o table`

# Switch active subscription
`az account set --subscription <ID-or-Name>`

# Show details of the currently logged-in identity
`az ad signed-in-user show`

# ==========================================================
# 📦 MODULE 2: RESOURCE GROUPS & TAGGING
# ==========================================================
# List all RGs in a specific location
`az group list --query "[?location=='eastus']" -o table`

# Create a new RG with Tags (Crucial for Architect tracking)
`az group create --name <rg-name> --location <region> --tags Environment=Prod Project=Nautilus`

# Delete RG without waiting for confirmation (Force cleanup)
`az group delete --name <rg-name> --no-wait --yes`

# ==========================================================
# 💻 MODULE 3: VIRTUAL MACHINES & SCALE SETS
# ==========================================================
# List all VM sizes available in a region
`az vm list-sizes --location <region> -o table`

# Deallocate VM (Stops billing for compute resources)
`az vm deallocate -g <rg> -n <vm>`

# Resize a VM (Requires Deallocation)
`az vm resize -g <rg> -n <vm> --size Standard_D4s_v3`

# Create a VM with SSH keys and managed identity
`az vm create -g <rg> -n <vm> --image Ubuntu2204 --admin-username azureuser --generate-ssh-keys --assign-identity`

# ==========================================================
# 🌐 MODULE 4: NETWORKING & SECURITY (NSG/VNET)
# ==========================================================
# Create a Virtual Network and Subnet
`az network vnet create -g <rg> -n <vnet-name> --address-prefix 10.0.0.0/16 --subnet-name <snet-name> --subnet-prefix 10.0.1.0/24`

# Peer two Virtual Networks (VNet Peering)
`az network vnet peering create -g <rg> -n <peer-name> --vnet-name <vnet1> --remote-vnet <vnet2-id> --allow-vnet-access`

# List all NICs on a VM
`az vm nic list -g <rg> --vm-name <vm> -o table`

# Create an NSG Rule for a specific IP range
`az network nsg rule create -g <rg> --nsg-name <nsg> --name AllowCorpIP --priority 110 --source-address-prefixes <Your-IP> --destination-port-ranges 80 443 --access Allow`

# ==========================================================
# 💾 MODULE 5: STORAGE, BLOBS & DISKS
# ==========================================================
# --- BASIC BLOB COMMANDS ---

# Upload file (Ensure --name is the cloud destination name)
`az storage blob upload --account-name <acc> --container-name <con> --name <blob> --file <local_path> --auth-mode login`

# Batch download (Entire Container)
`az storage blob download-batch --account-name <acc> --source <con> --destination <local_dir>`

# --- MANAGED DISKS ---

# Snapshot a disk (For backups before changes)
`az snapshot create -g <rg> --name <snap-name> --source <disk-id-or-name>`

# Resize an OS Disk
`az vm update -g <rg> -n <vm> --set storageProfile.osDisk.diskSizeGb=128`

# ==========================================================
# 🔐 MODULE 6: IDENTITY & ACCESS CONTROL (IAM)
# ==========================================================
# List RBAC role assignments for a user
`az role assignment list --assignee <user-email> -o table`

# Assign "Contributor" role to a user at the RG level
`az role assignment create --assignee <user-email> --role "Contributor" --resource-group <rg-name>`

# ==========================================================
# 🛠️ MODULE 7: PRO-TIPS & TROUBLESHOOTING
# ==========================================================

# 💡 ARGUMENT CHECK: Never use "--storage-account". Always use "--account-name".
# 💡 OUTPUT FILTERING: Use "--query" to filter results (e.g., `az vm list --query "[].name"`).
# 💡 AUTHENTICATION: Use "--auth-mode login" for Entra ID based storage access.
# 💡 STATIC IP: Convert Public IP to static: `az network public-ip update -g <rg> -n <ip-name> --allocation-method Static`
# 💡 COST SAVING: Always use `az vm deallocate` instead of `az vm stop` to stop compute billing.

# ==========================================================
# END OF COMPREHENSIVE REPOSITORY
# ==========================================================
