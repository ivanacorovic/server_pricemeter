class Cart < ActiveRecord::Base

	belongs_to :product
	belongs_to :list
	belongs_to :user
	validates :product, presence: true
	validates :user, presence: true
	validates :list, presence: true

end
