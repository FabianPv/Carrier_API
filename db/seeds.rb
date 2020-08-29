
Carrier.destroy_all

Carrier.create!([{
  name: "Fedex",
  model: "Fedex",
  status: "Activated"
},
{
  name: "Ups",
  model: "Ups",
  status: "Activated"
},
{
  name: "Estafeta",
  model: "Estafeta",
  status: "Deactivated"
}
])



