require 'spec_helper'

describe Listitem do

 	before { @listitem = FactoryGirl.create(:listitem) }
 	subject { @listitem }
 	
  it { should belong_to(:product) }
  it { should belong_to(:list) }
  it { should belong_to(:user) }
  it { should belong_to(:product) }
 	it { should validate_presence_of(:product) }
 	it { should validate_presence_of(:user) }
 	it { should validate_presence_of(:list) }
 	it { should validate_uniqueness_of(:id).scoped_to(:user_id, :product_id, :list_id) }

end
