class Student < ActiveRecord::Base
  has_many :ratings
  validates_uniqueness_of :lms_sid
  validates_uniqueness_of :institution_sid
  validates_presence_of :name

  class InvalidStudentRecordError < StandardError ; end

  def self.from_hash(hsh)
    lms_sid = hsh['id']
    institution_sid = hsh['login_id']
    name = hsh['name']
    student = self.find_by_lms_sid(lms_sid) ||
      self.find_by_institution_sid(institution_sid) ||
      self.create!(:lms_sid => lms_sid, :institution_sid => institution_sid, :name => name)
    
    raise InvalidStudentRecordError unless lms_sid==student.lms_sid && institution_sid==student.institution_sid
    student.id
  end
  
end
