FactoryGirl.define do
  factory :project do |f|
    f.name      "Vandelay"
    f.role      "Create prototype"
    f.status    "In Progress"
    f.priority  "High"
  end

  factory :project_all_fields, class: Project do |f|
    f.name            "MastaMindzLLC"
    f.role            "Site"
    f.status          "Completed"
    f.priority        "N/A"
    f.start_date      "2013-05-01"
    f.target_date     "2013-05-02"
    f.deadline        "2013-05-03"
    f.completion_date "2013-05-04"
    f.notes           "Completed mid-May. Client very satisfied"
  end

  factory :invalid_project, class: Project do |f|
    f.name nil
  end
end