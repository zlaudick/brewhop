json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :latitude, :longitude, :address, :description, :name
  json.url brewery_url(brewery, format: :json)
end
