param imageName string = 'chumaigwe9/bees-knee-website-cicd'
param imageTag string = '1.0'
param location string = 'canadacentral'
param dnsNameLabel string = 'beeskneeco-blue' // Blue environment

resource containerGroup 'Microsoft.ContainerInstance/containerGroups@2021-03-01' = {
  name: dnsNameLabel
  location: location
  properties: {
    containers: [
      {
        name: dnsNameLabel
        properties: {
          image: '${imageName}:${imageTag}'
          ports: [
            {
              port: 80
              protocol: 'TCP'
            }
          ]
          resources: {
            requests: {
              cpu: 1
              memoryInGB: 1
            }
          }
        }
      }
    ]
    osType: 'Linux'
    restartPolicy: 'Always'
    ipAddress: {
      ports: [
        {
          port: 80
          protocol: 'TCP'
        }
      ]
      type: 'Public'
      dnsNameLabel: dnsNameLabel
    }
  }
}
