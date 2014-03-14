FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "123456789"
    password_confirmation "123456789"

    factory :admin do
      admin true
    end
  end

  factory :product do
  	sequence(:name) { |n| "product_#{n}lala"}
  	image "smoki.jpeg"
  end

  factory :supermarket do
  	sequence(:name) { |n| "market_#{n}"}
  end

  factory :pricemeasure do
    price {rand(50.00)}
    measured_at {DateTime.now}
    discount true
    product
    supermarket
  end

end
