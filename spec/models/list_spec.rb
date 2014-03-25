require 'spec_helper'

describe List do

	it { should have_many(:listitems) }
  it { should have_many(:products).through(:listitems) }
  it { should have_many(:users).through(:listitems) }
  
end
