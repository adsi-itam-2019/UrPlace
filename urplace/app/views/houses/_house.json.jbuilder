json.extract! house, :id, :name, :address, :postal, :description, :lat, :lon, :rating, :price, :created_at, :updated_at
json.url house_url(house, format: :json)
