json.array!(@units) do |unit|
  json.extract! unit, :id, :name, :square_feet
  json.url unit_url(unit, format: :json)
end
