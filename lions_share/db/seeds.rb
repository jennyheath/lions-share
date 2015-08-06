listing_types = ["Rental", "Sale"]

addresses = [
  '303 Beverley Rd #9G, Brooklyn, NY 11218',
  '2339 Bragg St, Brooklyn, NY 11229',
  '696 E 43rd St, Brooklyn, NY 11203',
  'E 71st St, Brooklyn, NY 11234'
]

neighborhoods = ['Bushwick', 'Williamsburg', 'Crown Heights', 'Bed-Stuy', 'Greenpoint', 'Park Slope', 'Ridgewood', 'Clinton Hill']

photos = [
  'https://s3.amazonaws.com/nooklyn-pro/listings/3694/large/158094711.jpg?1438366942',
  'https://s3.amazonaws.com/nooklyn-pro/listings/3383/large/GatesBlock.jpg?1434001160',
  'https://s3.amazonaws.com/nooklyn-pro/listings/3666/large/IMG_0281.jpg?1438118099',
  'https://s3.amazonaws.com/nooklyn-pro/listings/3425/large/233_Weirfield_Street__3F.jpg?1436302021',
  'https://s3.amazonaws.com/nooklyn-pro/listings/2404/large/_MG_5560.JPG?1414339941',
  'https://s3.amazonaws.com/nooklyn-pro/listings/2508/large/OI000005.jpg?1436102386',
  'https://s3.amazonaws.com/nooklyn-pro/listings/3511/large/207_Ralph_Avenue-1.jpg?1436979906',
  'https://s3.amazonaws.com/nooklyn-pro/listings/3531/large/P7242571-001.JPG?1437847818',
  'https://s3.amazonaws.com/nooklyn-pro/listings/3653/large/IMG_2892.jpg?1437860365',
  'https://s3.amazonaws.com/nooklyn-pro/listings/1961/large/unnamed.jpg?1412165576'
]

10.times do
  Listing.create(
    type_of: listing_types.sample,
    price: rand(1000..4000).to_f,
    bed_count: rand(0.5..8).round(2),
    bath_count: rand(0.5..3).round(2),
    neighborhood: neighborhoods.sample,
    featured: [false, true].sample,
    description: Faker::Lorem.paragraph,
    address: addresses.sample,
    exclusive: [false, true].sample,
    no_fee: [false, true].sample
  )
end

amenities = [
  "High Ceilings",
  "Hardwood floors",
  "Video Intercom",
  "Eat In Kitchen",
  "Stainless Steel Appliances",
  "Stone countertops",
  "Granite countertops",
  "All pets ok",
  "Shared backyard",
  "Outdoor Space",
  "Dishwasher" ,
  "RoofDeck" ,
  "Luxuries" ,
  "Laundry In building" ,
  "Skyline view" ,
  "Roof access" ,
  "Zipcar" ,
  "Elevator"
]

amenities.each do |amenity|
  Amenity.create(name: amenity)
end

5.times do
  Broker.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    photo_url: 'https://s3.amazonaws.com/nooklyn-pro/agents/1800/medium/605EF0D3-213D-45D2-9897-E50FED79DAED.jpg?1426084410',
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number
  )
end

Listing.all.each do |listing|
  5.times do
    listing.amenities << Amenity.all.sample
  end
  listing.brokers << Broker.all.sample
  listing.photos.create(url: photos.sample)
end