class Description < ActiveRecord::Base
	belongs_to :recipe
	 validates :classification, presence: true
	 validates :recipe_id, presence: true
end
