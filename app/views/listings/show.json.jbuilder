json.type_of @listing.type_of
json.price @listing.price
json.bed_count @listing.bed_count
json.bath_count @listing.bath_count
json.neighborhood @listing.neighborhood
json.featured @listing.featured
json.address @listing.address
json.description @listing.description
json.square_footage @listing.square_footage
json.lot_square_footage @listing.lot_square_footage
json.yearly_taxes @listing.yearly_taxes
json.floor_plan_url @listing.floor_plan_url
json.building_type @listing.building_type
json.exclusive @listing.exclusive
json.no_fee @listing.no_fee
json.just_sold @listing.just_sold
json.in_contract @listing.in_contract
json.main_photo_url @listing.main_photo_url
json.created_at @listing.created_at
json.updated_at @listing.updated_at
json.latitude @listing.latitude
json.longitude @listing.longitude

json.photos do
  json.array! @listing.photos.each do |photo|
    json.extract! photo, :url
  end
end

json.brokers do
  json.array! @listing.brokers.each do |broker|
    json.extract! broker, :first_name, :last_name, :photo_url, :title, :email, :phone
  end
end

json.amenities do
  json.array! @listing.amenities.each do |amenity|
    json.extract! amenity, :name
  end
end

json.all_brokers do
  json.array! @brokers.each do |broker|
    json.extract! broker, :id,
                          :first_name,
                          :last_name,
                          :phone,
                          :email,
                          :photo_url
  end
end
