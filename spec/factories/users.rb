FactoryGirl.define do
  factory :user do
    email                 'art@vandalay.com'
    password              'password'
    password_confirmation 'password'
  end
end
