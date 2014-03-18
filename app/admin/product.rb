ActiveAdmin.register Product do

  index do
    selectable_column
    column :name
    column "Image", :image_content_type
    actions
  end

  # controller do
  #   skip_before_filter :authenticate_user!
  # end

end
