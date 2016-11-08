class RatingsController < ApplicationController

  before_action :verify_request_origin

  def new
    sess = Session.new(params)
    sess.populate_rating_info
    @course_name = sess.course_name
    return redirect_to(error_ratings_path,:notice => "No iteration is active.")  unless
      @iter = Iteration.current_iteration_for(sess.course_id)

    @rater = sess.rater
    @ratings = sess.other_students.map do |team_member|
      team_member.ratings.build(:rater => @rater, :iteration => @iter)
    end
    session[:ratings] = @ratings
  end
  def error
  end

  private

  def verify_request_origin
    return true
    return unless Rails.env.production?
    # TODO verify request came from Canvas, etc etc
  end

end
