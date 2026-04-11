
`az vm delete -g <resource group name> -n <vm name >  `  # delete vm 

`az vm list -o table` # list vm output via table

`az group list -o table` # resource group list . output via table

 list attached nic on VM 
`az vm nic list \
  --resource-group <Resource-Group> \
  --vm-name <vm name>` 

