class Iteration < ActiveRecord::Base
  has_many :ratings
  validates_presence_of :lms_courseid
  validates_presence_of :start
  validates_presence_of :end
  validates_presence_of :description
  validates_uniqueness_of :description, :scope => :lms_courseid

  validate :nonoverlapping

  private

  def nonoverlapping
    other_iters = Iteration.where("lms_courseid = ?", self.lms_courseid)
    ! other_iters.any? do |iter|
      self.start.between?(iter.start,iter.end) ||
        self.end.between?(iter.start,iter.end)
    end
  end
  
  def self.current_iteration_for(course)
    Iteration.where("(lms_courseid = ?) AND (? BETWEEN start AND end", course, Time.now).limit(1)
  end

end
