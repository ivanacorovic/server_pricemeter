module SignInHelpers

	def sign_up
		visit new_user_registration_path
		fill_in "user_email", with: "email@email.com"
		fill_in "user_password", with: "secret123"
		fill_in "user_password_confirmation", with: "secret123"
		click_button "Sign up"
	end
	
	def sign_in_as(user)	
		visit new_user_session_path
		fill_in "user_email", with: user.email
		fill_in "user_password", with: user.password
		click_button "Sign in"
	end

	def sign_in
		@user=FactoryGirl.create(:user)
		sign_in_as(@user)
	end

end

RSpec.configure do |config|
	config.include SignInHelpers
end