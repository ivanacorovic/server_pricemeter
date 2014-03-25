require 'spec_helper'

describe AdminUser do
   before { @user = FactoryGirl.create(:admin_user) }

 	 subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
end
