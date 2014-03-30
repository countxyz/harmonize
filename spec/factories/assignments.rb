FactoryGirl.define do
  factory :assignment do
    association :project
    description 'Refactor Project model.'
    status      'In Progress'
    priority    'High'
  end

  factory :another_assignment, class: Assignment do
    description 'Refactor Contact model.'
    status      'In Progress'
    priority    'High'
  end
end
