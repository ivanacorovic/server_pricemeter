class List < ActiveRecord::Base
	has_many :listitems
	has_many :products, through: :listitems
	has_many :users, through: :listitems


end
