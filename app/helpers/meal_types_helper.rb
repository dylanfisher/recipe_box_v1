module  MealTypesHelper

  def meal_type_class(recipe)
    "meal-type--#{recipe.meal_type.slug}"
  end

end
