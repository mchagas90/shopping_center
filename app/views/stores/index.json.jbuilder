json.array!(@stores) do |store|
  json.extract! store, :id, :name, :registration_code
  json.url store_url(store, format: :json)
end
