class SuggestionsController < ApplicationController

	before_filter :authenticate_user!
	
	def index
		@suggestions = Suggestion.all
	end

	def show
		@suggestion = Suggestion.find(params[:id])
	end

	def create
			@suggestion = Suggestion.create(suggestion_params)
			redirect_to products_path
	end

 private

    def suggestion_params
      params.require(:suggestion).permit(:name)
    end


end