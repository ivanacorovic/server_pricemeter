require 'spec_helper'

describe Pricemeasure do
	it { should belong_to(:product) }
	it { should belong_to(:supermarket) }
 	it { should validate_presence_of(:product) }
 	it { should validate_presence_of(:supermarket) }
end
