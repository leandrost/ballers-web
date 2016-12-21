# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Court.create([
  {
    name: "Baskquete ICV",
    address: "Rua Maricá, 320, Praça Seca, Rio de Janeiro, State of Rio de Janeiro, Brazil",
    coordinates: { latitude: -22.8903048, longitude: -43.345593399999984 }
  },
  {
    name: "Basquete IBB",
    address: "Igreja Batista Betânia Tabernáculo de Adoração, Estrada Manuel Nogueira de Sá, Realengo, Rio de Janeiro, State of Rio de Janeiro, Brazil",
    coordinates: { latitude: -22.8885352, longitude: -43.41397269999999 }
  },
  {
    name: "Baskeire",
    address: "Rua Cairuçu, Vila Valqueire, Rio de Janeiro, State of Rio de Janeiro, Brazil",
    coordinates: { latitude: -22.8810174, longitude: -43.37163129999999 }
  },
  {
    name: "Praça Patriarca",
    address: "Rua Andrade Pinto, Madureira, Rio de Janeiro, State of Rio de Janeiro, Brazil",
    coordinates: { latitude: -22.8774477, longitude: -43.34235460000002 }
  }
])
