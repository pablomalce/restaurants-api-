json.extract! @restaurant, :id, :name, :address
json.comments @restaurant.comments do |restaurant|
  json.extract! comment, :id, :content
end
