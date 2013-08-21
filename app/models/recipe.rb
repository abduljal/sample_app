class Recipe < ActiveRecord::Base
	has_many :ingredients, :dependent => :destroy
	has_many :steps, :dependent => :destroy
	has_many :descriptions, :dependent => :destroy
	validates :name, presence: true,uniqueness: true
	validates :serves, presence: true
end
