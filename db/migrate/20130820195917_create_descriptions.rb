class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :classification
      t.integer :recipe_id

      t.timestamps
    end
  end
end
