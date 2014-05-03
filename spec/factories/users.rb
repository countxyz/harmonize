FactoryGirl.define do
  factory :user do
    handle                'BigBird'
    password              'password'
    password_confirmation 'password'
  end
end
