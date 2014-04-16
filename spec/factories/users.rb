FactoryGirl.define do
  factory :user do
    handle                'BigBird'
    email                 'BigBird@sesamestreet.org'
    password              'password'
    password_confirmation 'password'
  end
end
