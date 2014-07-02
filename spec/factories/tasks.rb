FactoryGirl.define do
  factory :task do
    description 'A new task'
    deadline    { 1.hour.from_now }
    association :user
  end

  factory :task_2, class: Task do
    description 'Lunch with George'
    completed { 1.day.ago }
    association :user
  end

  factory :task_3, class: Task do
    description 'Breakfast with Tiffany'
    completed { 2.days.ago }
    association :user
  end

  factory :task_4, class: Task do
    description 'Dinner with Jerry'
    association :user
  end
end
