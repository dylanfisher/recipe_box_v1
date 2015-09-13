class CreateAdjectives < ActiveRecord::Migration
  def change
    create_table :adjectives do |t|
      t.string :text
      t.belongs_to :recipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
