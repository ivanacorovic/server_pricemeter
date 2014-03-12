FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "123456789"
    password_confirmation "123456789"
    
    factory :admin do
      admin true
    end
  end
end
