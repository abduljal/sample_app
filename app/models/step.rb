class Step < ActiveRecord::Base
	belongs_to :recipe, :dependent => :destroy
	validates :process, presence: true
	validates :order, presence: true
	 validates :recipe_id, presence: true
end
