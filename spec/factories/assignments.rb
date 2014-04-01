FactoryGirl.define do
  factory :assignment do
    description 'Refactor Project model.'
    status      'In Progress'
    priority    'High'
    association :project
  end

  factory :another_assignment, class: Assignment do
    association :project_with_assignments
    description 'Refactor Contact model.'
    status      'In Progress'
    priority    'High'
  end
end
