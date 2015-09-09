class AddSlugToMealTypes < ActiveRecord::Migration
  def change
    add_column :meal_types, :slug, :string
  end
end
