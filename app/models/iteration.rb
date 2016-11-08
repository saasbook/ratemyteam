class Iteration < ActiveRecord::Base
  has_many :ratings
  validates_presence_of :lms_courseid
  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_presence_of :description
  validates_uniqueness_of :description, :scope => :lms_courseid

  validate :nonoverlapping

  attr_accessor :other_students

  private

  def nonoverlapping
    other_iters = Iteration.where("lms_courseid = ?", self.lms_courseid)
    ! other_iters.any? do |iter|
      self.start_time.between?(iter.start_time,iter.end_time) ||
        self.end_time.between?(iter.start_time,iter.end_time)
    end
  end

  public

  def self.current_iteration_for(course)
    Iteration.where("(lms_courseid = ?) AND (? BETWEEN start_time AND end_time)", course, Time.now).first
  end

end
