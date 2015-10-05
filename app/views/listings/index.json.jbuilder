json.listings do
  json.array! @listings.each do |listing|
    json.extract! listing, :id,
                           :type_of,
                           :price,
                           :bed_count,
                           :bath_count,
                           :neighborhood,
                           :address,
                           :description,
                           :featured,
                           :exclusive,
                           :no_fee,
                           :main_photo_url,
                           :created_at,
                           :updated_at,
                           :latitude,
                           :longitude
    json.amenities do
      json.array! listing.amenities.each do |amenity|
        json.extract! amenity, :name
      end
    end
  end
end

json.neighborhoods @neighborhoods
json.beds @beds
json.amenities @amenities
json.building_types @building_types
