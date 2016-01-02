class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :url
      t.string :picture
      t.text :description
      t.timestamps null: false
    end
  end
end
