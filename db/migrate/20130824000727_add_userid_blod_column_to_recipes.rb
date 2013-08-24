class AddUseridBlodColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :user_id, :integer
    add_column :recipes, :blog, :string
  end
end
