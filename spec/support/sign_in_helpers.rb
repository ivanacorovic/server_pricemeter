module SignInHelpers

	def sign_up

	end
	
	def sign_in
		visit new_user_session_path
		fill_in "user_email", with: "example@rubyonrails.org"
		fill_in "user_password", with: "ivanaivana"
		click_button "Sign in"
	end

	def sign_in_fake
		visit sign_in_path
		fill_in "user_email", with: "person@example.com"
		fill_in "user_password", with: "123456"
		click_button "Sign in"
	end

end

RSpec.configure do |config|
	config.include SignInHelpers
end