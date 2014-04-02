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

  factory :invalid_date, class: Assignment do
    description 'Illogical'
    status      'Completed'
    priority    'N/A'
    start_date  { 1.day.ago  }
    completed   { 1.week.ago }
  end
end
