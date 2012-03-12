class ApplicationController < ActionController::Base
  protect_from_forgery
  attr_writer :conference

  private

  def conference
    @conference ||= CONFERENCE
  end
end
