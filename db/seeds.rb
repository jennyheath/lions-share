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
    type_of: ["Rental", "Sale"].sample,
    price: [1500,2000,2500,3000,3500].sample,
    bed_count: [0,1,2,3,4].sample,
    bath_count: [1,1.5,2].sample,
    neighborhood: neighborhoods.sample,
    featured: [false, true].sample,
    description: Faker::Lorem.paragraph,
    address: addresses.pop,
    exclusive: [false, true].sample,
    no_fee: [false, true].sample,
    main_photo_url: photos.pop,
    square_footage: [1700, 2000, 3200, 4400].sample,
    lot_square_footage: [1800, 2000, 2200].sample,
    yearly_taxes: [2100, 2400].sample,
    floor_plan_url: "http://res.cloudinary.com/dl1rhzsmu/image/upload/v1443639659/Screen_Shot_2015-09-30_at_12.00.04_PM_wp5yfx.png"
  )
end

building_types = ["Condo", "Co-op", "House", "Multi-family"]

Listing.where(type_of: "Sale").each do |listing|
  listing.building_type = building_types.sample
  listing.save!
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
  "Parking",
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

extra_photos = [
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-1.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-10.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-11.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-2.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-3.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-4.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-5.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-6.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-7.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-8.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image-9.jpg",
  "https://s3-us-west-1.amazonaws.com/lions-share-pictures/image.jpg"
]

# extra_photos.each do |photo_url|
#   Photo.create(url: photo_url)
# end

Listing.all.each do |listing|
  5.times do
    listing.amenities << Amenity.all.sample
  end
  listing.brokers << Broker.all.sample
  10.times do
    listing.photos << Photo.create(url: extra_photos.sample)
  end
end
