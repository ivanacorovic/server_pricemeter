require 'spec_helper'

feature 'Sing in user' do 
	scenario 'user an email as a username' do	
		visit new_user_session_path
		page.has_content?("email")
		fill_in 'user_email', with: "example@rubyonrails.org"
		fill_in 'user_password', with: "ivanaivana"
		click_button 'Sign in'
		page.has_content?("Sign in")
	end
end
