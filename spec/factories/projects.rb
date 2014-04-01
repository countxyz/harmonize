FactoryGirl.define do
  factory :project do
    name 'Vandalay'

    factory :project_with_assignments do
      ignore do
        assignments_count 2
      end

      after(:create) do |project, evaluator|
        create_list(:assignment, evaluator.assignments_count, project: project)
      end
    end
  end
end
