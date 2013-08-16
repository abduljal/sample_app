class Recipe < ActiveRecord::Base
	has_many :ingredients
	has_many :steps
	validates :name, presence: true,uniqueness: true
end
