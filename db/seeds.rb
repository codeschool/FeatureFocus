Vendor.destroy_all
User.destroy_all

v1 = Vendor.create_with_coordinates!(name: 'Abuelo',
                                     address: '2431 West Osceola Pkwy, Kissimmee, FL 34741',
                                     category: 'Mexican Food')
v1.deals.create!(title: 'Free Tequila', description: 'Free Tequila with the purchase of a Meal.')


v2 = Vendor.create_with_coordinates!(name: 'Agave Azul',
                                     address: '4750 S Kirkman Rd, Orlando, FL 32811',
                                     category: 'Mexican Food')
v2.deals.create!(title: 'Unlimited Queso', description: 'All You Can Queso!')


v3 = Vendor.create_with_coordinates!(name: 'Tijuana Flats',
                                     address: '8 N Summerlin Ave, Orlando, FL 32801',
                                     category: 'Mexican Food')
v3.deals.create!(title: '$1 Tacos', description: 'Eat a lot of tacos')


User.create!(email: 'foo@bar.com', latlon: 'POINT(-81.368804 28.538042)')

