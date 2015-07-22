listing_types = ["Rental", "Sale", "Sale by Owner"]

50.times do
  Listing.create(
    type_of: listing_types.sample,
    price: rand(1000..4000).to_f,
    bed_count: rand(0.5..8).round(2),
    bath_count: rand(0.5..3).round(2),
    neighborhood: Faker::Address.city,
    featured: [false, true].sample,
    description: Faker::Lorem.paragraph
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

10.times do
  Broker.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    photo_url: Faker::Avatar.image,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number
  )
end

Listing.all.each do |listing|
  5.times do
    listing.amenities << Amenity.all.sample
    listing.brokers << Broker.all.sample
    listing.photos.create(url: Faker::Avatar.image)
  end
end