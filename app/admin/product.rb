ActiveAdmin.register Product do

  index do
    selectable_column
    column :name
    column "Image", :image_content_type
    actions
  end

  controller do
	  def permitted_params
	      params.permit(product: [:name, :image_file_name, 
	      	:image_content_type, :image_file_size, :image_updated_at])
	    end
	end

end
