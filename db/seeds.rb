User.destroy_all
Deal.destroy_all
Vendor.destroy_all

v1 = Vendor.create_with_coordinates!(name: 'Abuelo',
                                     address: '2431 West Osceola Pkwy, Kissimmee, FL 34741',
                                     category: 'Mexican Food')

tequila = v1.deals.create!(title: 'Mas Tequila!',
                           description: '20% Off Tequilas with the purchase of a Meal.',
                           price_in_cents: 1500,
                           ends_at: 30.minutes.from_now)



v2 = Vendor.create_with_coordinates!(name: 'Agave Azul',
                                     address: '4750 S Kirkman Rd, Orlando, FL 32811',
                                     category: 'Mexican Food')

queso = v2.deals.create!(title: 'Unlimited Queso',
                         description: 'All You Can Queso!',
                         price_in_cents: 1000,
                         ends_at: 45.minutes.from_now)



v3 = Vendor.create_with_coordinates!(name: 'Tijuana Flats',
                                     address: '8 N Summerlin Ave, Orlando, FL 32801',
                                     category: 'Mexican Food')

taco = v3.deals.create!(title: '$1 Tacos',
                        description: 'Five $1 Tacos',
                        price_in_cents: 500,
                        ends_at: 160.minutes.from_now)


current = User.create!(name: 'Gregg', email: 'Gregg@codeschool.com', latlon: nil)

User.create!(name: 'Carlos', email: 'carlos@codeschool.com')
User.create!(name: 'Jon', email: 'jon@codeschool.com')

