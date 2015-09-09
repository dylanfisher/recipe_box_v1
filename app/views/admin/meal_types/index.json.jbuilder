json.array!(@meal_types) do |meal_type|
  json.extract! meal_type, :name, :recipe_id
  json.url meal_type_url(meal_type, format: :json)
end