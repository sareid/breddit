class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :comment_id
      t.integer :recipe_id
    end
  end
end
