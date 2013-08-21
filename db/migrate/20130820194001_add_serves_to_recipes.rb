class AddServesToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :serves, :integer
  end
end
