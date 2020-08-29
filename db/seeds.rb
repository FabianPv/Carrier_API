
AccessConnectionDatum.destroy_all
Carrier.destroy_all


Carrier.create!([{
  name: "Fedex",
  model: "FedexCarrier",
  status: "Active",
  access_connection_datum_attributes:
      {
          access_data: { key: 'O21wEWKhdDn2SYyb',
                         password: 'db0SYxXWWh0bgRSN7Ikg9Vunz',
                         account_number: '510087780',
                         meter: '119009727',
                         mode: 'test'}
      }
},
{
  name: "Ups",
  model: "UpsCarrier",
  status: "Active"
},
{
  name: "Estafeta",
  model: "EstafetaCarrier",
  status: "Active"
}
])




