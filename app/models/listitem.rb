class Listitem < ActiveRecord::Base

	belongs_to :product
	belongs_to :list
	belongs_to :user
	validates :product, presence: true
	validates :user, presence: true
	validates :list, presence: true

	validates_uniqueness_of :id, :scope => [:user_id, :product_id, :list_id]
end
