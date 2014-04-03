require 'factory_girl'


namespace :db do
  desc "Fill database with sample data"
    task populate: :environment do
      require File.expand_path("spec/factories.rb")
      @users = FactoryGirl.create_list(:user, 5)
      @supermarkets = FactoryGirl.create_list(:supermarket, 3)
      @products = FactoryGirl.create_list(:product, 20)
      @lists = FactoryGirl.create_list(:list, 5)
      @supermarkets.each do |market| 
        @products.each do |product| 
          FactoryGirl.create_list(:pricemeasure, 20, product: product, supermarket: market)
        end
      end
    end
end
