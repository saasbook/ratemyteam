Given /^today is "(.*)"$/ do |time|
  Timecop.travel Time.parse(time)
end

Given /^course ID "(.*)" has "(.*)" from "(.*)" to "(.*)"$/ do |crse,iter,start,stop|
  FactoryGirl.create(:iteration,
    :start_time => Time.parse(start), :end_time => Time.parse(stop),
    :description => iter)
end
