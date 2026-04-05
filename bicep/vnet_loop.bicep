param location string = 'eastus'

// 🔹Create VNet(s)
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = [
  for i in range(1, 2): {  // Loop to create VNets
    name: 'vnet-${i}'
    location: location
    properties: {
      addressSpace: {
        addressPrefixes: [
          '10.${i}.0.0/16'  // VNet address space
        ]
      }
      subnets: [
        {
          name: 'Subnet-1'
          properties: {
            addressPrefix: '10.${i}.0.0/24'  // First subnet
          }
        }
        {
          name: 'Subnet-2'
          properties: {
            addressPrefix: '10.${i}.1.0/24'  // Second subnet
          }
        }
      ]
    }
  }
]
