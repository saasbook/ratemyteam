class Rating < ActiveRecord::Base
  belongs_to :student
  belongs_to :rater, :class_name => 'Student'
  belongs_to :iteration
  validates :stars, :numericality => {:only_integer => true, :greater_than => 0, :less_than => 5}

  

end
