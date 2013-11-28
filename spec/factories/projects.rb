FactoryGirl.define do
  factory :project do |f|
    f.name      "Vandelay"
    f.role      "Create prototype"
    f.status    "In Progress"
    f.priority  "High"

    factory :project_all_fields do |f|
      f.name            "MastaMindzLLC"
      f.role            "Site"
      f.status          "Completed"
      f.priority        "N/A"
      f.start_date      "05/01/2013"
      f.target_date     "05/02/2013"
      f.deadline        "05/03/2013"
      f.completion_date "05/04/2013"
      f.notes           "Completed mid-May. Client very satisfied"

      factory :invalid_project do |f|
        f.name nil
      end
    end
  end
end