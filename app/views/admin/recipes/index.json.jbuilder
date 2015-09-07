json.array!(@recipes) do |recipe|
  json.extract! recipe, :title, :description, :ingredients, :method
  json.url recipe_url(recipe, format: :json)
end