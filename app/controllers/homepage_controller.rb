class HomepageController < ApplicationController
	def home
		@supermarkets = Supermarket.all
	end
end