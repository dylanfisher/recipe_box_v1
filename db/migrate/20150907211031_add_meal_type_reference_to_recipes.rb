class AddMealTypeReferenceToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :meal_type, index: true
  end
end
