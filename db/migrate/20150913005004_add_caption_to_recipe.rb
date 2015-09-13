class AddCaptionToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :caption, :string
  end
end
