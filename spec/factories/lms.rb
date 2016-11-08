FactoryGirl.define do

  factory :iteration do
    description "Iteration 1"
    lms_courseid "1451720"
    start_time { Time.now }
    end_time { 1.week.from_now }
  end

end
