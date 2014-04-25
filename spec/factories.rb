FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password "123456789"
    password_confirmation "123456789"
  end

  factory :admin_user do
    email "ivana@example.com"
    password 'password'
    password_confirmation 'password'
  end

  factory :product do
  	name {Faker::Product.product_name}
    bar_code { "11111111" }
  end

  factory :supermarket do
    name {Faker::Company.name}
  end

  factory :pricemeasure do
    price {rand(50.00)}
    measured_at {rand(50).days.ago}
    discount true
    product
    bar_code {product.bar_code}
    supermarket
  end

  factory :list do
    sequence(:name) { |n| "list_#{n}"}
  end

  factory :listitem do
    product
    user
    list
  end

end
