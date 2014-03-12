require 'spec_helper'

	feature 'Sing in user' do 
		scenario 'with user email and password' do	
			@user=FactoryGirl.create(:user)
	 	  sign_in(@user)
	  	expect(page).to have_css('a', text: "Logout")
	  	click_link("Logout")
	  	expect(page).to have_css('a', text: "Login")
	end
end
