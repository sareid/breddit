class AddUserToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :user, :string
  end
end
