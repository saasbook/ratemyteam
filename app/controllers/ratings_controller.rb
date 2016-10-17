class RatingsController < ApplicationController

  before_action :verify_request_origin

  def new
    begin
      @session = Session.new(params)
      @session.populate_rating_info
    rescue StandardError => e
      head :bad_request
    end
  end


  private

  def verify_request_origin
    return unless Rails.env.production?
    # TODO verify request came from Canvas, etc etc
  end

end
