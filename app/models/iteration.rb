class Iteration < ActiveRecord::Base
  has_many :ratings
  validates_presence_of :lms_courseid
  validates_presence_of :start
  validates_presence_of :end
  validates_presence_of :description

end
