module SignInHelpers

	def sign_up(user)
		visit new_user_session_path
		fill_in "user_email", with: user.email
		fill_in "user_password", with: user.password
		fill_in "user_password_confirmation", with: user.password_confirmation
		click_button "Sign up"
	end
	
	def sign_in(user)	
		visit new_user_session_path
		fill_in "user_email", with: user.email
		fill_in "user_password", with: user.password
		click_button "Sign in"
	end

end

RSpec.configure do |config|
	config.include SignInHelpers
end