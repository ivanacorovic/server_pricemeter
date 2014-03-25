require 'spec_helper'

describe Supermarket do
	it {should have_many(:pricemeasures)}
	it {should have_many(:products).through(:pricemeasures)}
end
