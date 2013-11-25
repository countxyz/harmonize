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
      f.start_date      "2013-05-01"
      f.target_date     "2013-05-10"
      f.deadline        "2013-05-12"
      f.completion_date "2013-05-09"
      f.notes           "Completed mid-May. Client very satisfied"
    end
  end
end