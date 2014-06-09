FactoryGirl.define do
  factory :user do
    id                    100
    handle                'BigBird'
    password              'password'
    password_confirmation 'password'

    factory :admin do
      admin true
    end
  end
end
