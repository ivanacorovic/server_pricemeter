FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "123456789"
    password_confirmation "123456789"
  end

  factory :admin_user do
    email "admin@example.com"
    password 'password'
    password_confirmation 'password'
  end

  factory :product do
  	sequence(:name) { |n| "product_#{n}lala"}
    image { fixture_file_upload 'public/images/medium/coca-cola.jpeg', 'image/jpeg' }
  end

  factory :supermarket do
  	sequence(:name) { |n| "market_#{n}"}
  end

  factory :pricemeasure do
    price {rand(50.00)}
    measured_at {1.days.ago}
    discount true
    product
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
