json.listings @listings
json.neighborhoods @listings.uniq.pluck(:neighborhood)
json.beds @listings.uniq.pluck(:bed_count)
json.amenities do
  json.array! @listings.each do |listing|
    listing.amenities.each do |amenity|
      json.extract! amenity, :name
    end
  end
end
