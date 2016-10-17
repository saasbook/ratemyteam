class Student < ActiveRecord::Base
  has_many :ratings
  validates_uniqueness_of :ucb_sid
  validates_presence_of :name

  def self.from_hash(hsh)
    self.from_ucb_sid hsh['sis_user_id'], hsh['name']
  end

  def self.from_ucb_sid(ucb_sid, name)
    Student.where("ucb_sid = ?", ucb_sid).first  ||
      Student.create!(:ucb_sid => ucb_sid, :name => name)
  end
end
