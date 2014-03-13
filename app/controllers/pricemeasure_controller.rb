class Pricemeasure < ApplicationController

	def index
		@pricemeasures=Pricemeasure.all
	end

	def show
	end

	def self.descending
		Pricemeasure.order("measured_at DESC")
	end

end