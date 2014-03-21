FactoryGirl.define do
  factory :assignment do
    association :project
    description 'Refactor Project model.'
    status      'In Progress'
    priority    'High'
  end
end
