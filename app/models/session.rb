# https://bcourses.berkeley.edu/doc/api/live

class Session

  require 'canvas-api'
  
  attr_reader :canvas, :course_id, :course_name, :student_id
  attr_reader :other_students, :errors

  def initialize(params={})
    @canvas = Canvas::API.new(
      :host => params[:canvas_host] || Figaro.env.canvas_host,
      :token => params[:canvas_api_key] || Figaro.env.canvas_api_key)
    @student_id = params[:custom_canvas_user_id]
    @course_id = params[:custom_canvas_course_id]
    @course_name = params[:context_title]
    @other_students = []
    @errors = ActiveModel::Errors.new(self)
  end

  def populate_rating_info
    self.errors.add(:base, "You don't appear to be in any groups.") and return unless
      members = find_group_for_student
    @rater = Student.from_lms_sid(@student_id)
    @other_students = members.map { |student| Student.from_hash(student) }
  end

  def groups_in_course
    canvas.get("/api/v1/courses/#{course_id}/groups").map { |g| g['id'] }
  end

  def find_group_for_student
    members = nil
    groups_in_course.each do |grp|
      members = canvas.get("/api/v1/groups/#{grp}/users")
      break if members.any? { |member| member['id'].to_s == student_id }
    end
    members
  end

end
