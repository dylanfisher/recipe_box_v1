class RemoveIngredientStringFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :ingredients
  end
end
