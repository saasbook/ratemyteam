class Rating < ActiveRecord::Base
  belongs_to :student
  belongs_to :rater, :class_name => 'Student'
  belongs_to :iteration
end
