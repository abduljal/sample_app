class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :process
      t.integer :order
	  t.integer :recipe_id
      t.timestamps
    end
  end
end
