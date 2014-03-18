class List < ActiveRecord::Base
	has_many :carts
	has_many :products, through: :carts
	has_many :users, through: :carts


end
