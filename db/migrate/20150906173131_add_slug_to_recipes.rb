class AddSlugToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :slug, :string
    change_column :recipes, :slug, :string, :null => false
    add_index :recipes, :slug, :unique => true
  end

  def down
    add_column :recipes, :slug
    remove_index :recipes, :slug
  end
end
