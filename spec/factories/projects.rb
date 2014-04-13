FactoryGirl.define do
  factory :project do
    name 'Vandalay'
    created_at { 2.days.ago }

    factory :project_with_assignments do
      ignore do
        assignments_count 2
      end

      after(:create) do |project, evaluator|
        create_list(:assignment, evaluator.assignments_count, project: project)
      end
    end
  end

  factory :last_project, class: Project do
    name 'Harmonize'
    created_at { 1.day.ago }
  end
end
