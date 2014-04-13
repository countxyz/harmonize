FactoryGirl.define do
  factory :task do
    description 'Call Art Vandelay'
  end

  factory :task_2, class: Task do
    description 'Lunch with George'
  end

  factory :task_3, class: Task do
    description 'Dinner with Jerry'
    completed { 1.day.ago }
  end
end
