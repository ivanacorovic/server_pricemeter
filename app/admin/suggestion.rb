ActiveAdmin.register Suggestion do

  index do
    column :name
    actions do |suggestion|
      link_to "Serve", serve_suggestion_path(suggestion),  :class => "member_link"
    end
  end

  # controller do
  #   skip_before_filter :authenticate_user!
  # end

 

end