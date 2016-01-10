json.brokers do
  json.array! @brokers.each do |broker|
    json.extract! broker, :id,
                           :first_name,
                           :last_name,
                           :photo_url,
                           :title,
                           :email,
                           :phone
  end
end