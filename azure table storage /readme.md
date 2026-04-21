
This project demonstrates how to set up a NoSQL database using Azure Table Storage.
both Azure Portal and Azure CLI methods for creating the storage account, tables, and inserting data.
🏗️ Step-by-Step Implementation

1. Create a Storage Account

    Portal: Go to Storage accounts > Create. Name it ```datacentertablest2100``` in the East US region with Standard LRS.

 # CLI Command:

          az storage account create \
          --name datacentertablest2100 \
          --resource-group <Your-Resource-Group> \
          --location eastus \
          --sku Standard_LRS

Why? : A Storage Account is the top-level container for all Azure Storage services. We need it to host our tables, blobs, or files.


# 2. Create a Table Storage Table

    Portal: Inside your storage account, go to Data storage > Tables. Click + Table and name it tasks.

# CLI Command:

    az storage table create \
    --name tasks \
    --account-name datacentertablest2100 \
    --auth-mode key

Why? : A Table is where our actual NoSQL data (entities) will live. It’s highly scalable and ideal for simple key-value datasets.



3. Prepare Data Entities

We need to insert the following tasks:

    PartitionKey	RowKey	Description	Status
    tasks	          1	      Learn       Table Storage	completed
    tasks	          2	      Build       To-Do App	in-progress

Why? : Each entity requires a PartitionKey (for grouping data) and a RowKey (for unique identification). Custom properties like description and status can be added without a fixed schema.
4. Insert Table Entities

    Portal (Storage Browser): Go to Storage browser > Tables > tasks. Click + Add entity. Manually add the properties and values.

# CLI Command:



# # # Insert Task 1
      az storage entity insert \
      --account-name datacentertablest2100 \
      --table-name tasks \
      --entity PartitionKey=tasks RowKey=1 description="Learn Table Storage" status="completed" \
      --auth-mode key

## # Insert Task 2
      az storage entity insert \
      --account-name datacentertablest2100 \
      --table-name tasks \
      --entity PartitionKey=tasks RowKey=2 description="Build To-Do App" status="in-progress" \
      --auth-mode key

Why? : Inserting entities via CLI is faster for automation, while the Storage Browser is great for manual verification and quick edits.

# varify from CLI

    az storage entity query \
      --account-name datacentertablest2100 \
      --table-name tasks \
      --output table

