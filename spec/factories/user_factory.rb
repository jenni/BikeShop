FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@exahmplems.com" }
  factory :user do
    email
    first_name 'Test'
    last_name 'Example'
    password '123456'
    admin false
  end

  factory :admin, class: User do
    email
    password '123456'
    admin true
    first_name 'Admin'
    last_name 'User'
    password '123456'
  end
end
