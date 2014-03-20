ActiveAdmin.register Suggestion do

  index do
    column :name
    actions do |suggestion|
      link_to "Serve", serve_suggestion_path(suggestion),  :class => "member_link"
    end
  end

	controller do
	  def permitted_params
	      params.permit(suggeston: [:name])
	    end
	end
 

end