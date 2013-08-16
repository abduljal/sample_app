class Step < ActiveRecord::Base
	belongs_to :recipe
	validates :process, presence: true
	validates :order, presence: true
end
