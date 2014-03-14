require 'factory_girl'


namespace :db do
  desc "Fill database with sample data"
    task populate: :environment do
      require File.expand_path("spec/factories.rb")
      @supermarkets = FactoryGirl.create_list(:supermarket, 3)
      @products = FactoryGirl.create_list(:product, 20)
      @supermarkets.each do |market| 
        @products.each do |product| 
          FactoryGirl.create(:pricemeasure, product: product, supermarket: market)
        end
      end
  end
end
