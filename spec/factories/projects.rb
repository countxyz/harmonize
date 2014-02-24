FactoryGirl.define do
  factory :project do
    name      "Vandelay"
    role      "Create prototype"
    status    "In Progress"
    priority  "High"
  end

  factory :project_all_fields, class: Project do
    name            "MastaMindzLLC"
    role            "Site"
    status          "Completed"
    priority        "N/A"
    start_date      "2013-05-01"
    target_date     "2013-05-02"
    deadline        "2013-05-03"
    completion_date "2013-05-04"
    notes           "Completed mid-May. Client very satisfied"
  end

  factory :invalid_project, class: Project do
    name nil
  end
end