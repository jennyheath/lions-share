listing_types = ["Rental", "Sale"]

addresses = [
  '303 Beverley Rd #9G, Brooklyn, NY 11218',
  '2339 Bragg St, Brooklyn, NY 11229',
  '696 E 43rd St, Brooklyn, NY 11203',
  'E 71st St, Brooklyn, NY 11234',
  '590 Myrtle Ave Brooklyn, NY 11205',
  '1048 Bedford Ave Brooklyn, NY 11205',
  '247 Dekalb Ave Brooklyn, NY 11205',
  '87 Lafayette Ave Brooklyn, NY 11217',
  '80 Hanson Pl Brooklyn, NY 11217',
  '131 Cumberland Walk Brooklyn, NY 11205'
]

neighborhoods = ['Bushwick', 'Williamsburg', 'Crown Heights', 'Bed-Stuy', 'Greenpoint', 'Park Slope', 'Ridgewood', 'Clinton Hill']

photos = [
  'https://s3-us-west-1.amazonaws.com/thelionsshare/158094711.jpg',
  'https://s3-us-west-1.amazonaws.com/thelionsshare/207_Ralph_Avenue-1.jpg',
  'https://s3-us-west-1.amazonaws.com/thelionsshare/233_Weirfield_Street__3F.jpg',
  'https://s3-us-west-1.amazonaws.com/thelionsshare/GatesBlock.jpg',
  'https://s3-us-west-1.amazonaws.com/thelionsshare/IMG_0281.jpg',
  'https://s3-us-west-1.amazonaws.com/thelionsshare/IMG_2892.jpg',
  'https://s3-us-west-1.amazonaws.com/thelionsshare/OI000005.jpg',
  'https://s3-us-west-1.amazonaws.com/thelionsshare/P7242571-001.jpeg',
  'https://s3-us-west-1.amazonaws.com/thelionsshare/_MG_5560.jpeg',
  'https://s3-us-west-1.amazonaws.com/thelionsshare/unnamed.jpg'
]

photos.each do |photo_url|
  Photo.create(url: photo_url)
end

10.times do
  Listing.create(
    type_of: "Rental",
    price: [1500,2000,2500,3000,3500].sample,
    bed_count: [1,2,3].sample,
    bath_count: [1,1.5,2].sample,
    neighborhood: neighborhoods.sample,
    featured: [false, true].sample,
    description: Faker::Lorem.paragraph,
    address: addresses.pop,
    exclusive: [false, true].sample,
    no_fee: [false, true].sample,
    main_photo_url: photos.pop
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
  # listing.photos.create(url: photos.sample)
end