FactoryGirl.define do
  factory :user do
    id                    1
    handle                'BigBird'
    password              'password'
    password_confirmation 'password'

    factory :admin_user do
      admin true
    end
  end
end
