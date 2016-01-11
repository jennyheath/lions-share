json.broker @broker
json.listings do
  json.array! @listings.each do |listing|
    json.extract! listing, :id,
                           :price,
                           :bed_count,
                           :bath_count,
                           :neighborhood,
                           :description,
                           :featured,
                           :exclusive,
                           :no_fee,
                           :main_photo_url
  end
end