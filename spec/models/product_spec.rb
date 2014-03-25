require 'spec_helper'

describe Product do

  before { @product = FactoryGirl.create(:product) }
 	subject { @product }
  it { should have_many(:pricemeasures) }
  it { should have_many(:supermarkets).through(:pricemeasures) }
  it { should have_many(:listitems)}
  #it { should have_attached_file(:image) }
	#it { should have_validate_content_type(:image,:content_type => /\Aimage\/.*\Z/ ) }
end
