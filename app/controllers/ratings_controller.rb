class RatingsController < ApplicationController

  before_action :verify_request_origin

  def new
    session = Session.new(params)
    session.populate_rating_info
    @course_name = session.course_name
    return redirect_to(error_ratings_path,:notice => "No iteration is active.")  unless
      @iter = Iteration.current_iteration_for(session.course_id)

    @rater = session.rater
    @ratings = session.other_students.map do |team_member|
      team_member.ratings.build(:rater => @rater, :iteration => @iter)
    end
    session[:ratings] = @ratings
  end
  def error
  end

  private

  def verify_request_origin
    return unless Rails.env.production?
    # TODO verify request came from Canvas, etc etc
  end

end
