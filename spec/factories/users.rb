FactoryGirl.define do
  sequence(:handle) { |n| "user#{n}" }

  factory :user do
    handle                { generate(:handle) }
    password              'password'
    password_confirmation 'password'

    factory :admin do
      admin true
    end
  end
end
