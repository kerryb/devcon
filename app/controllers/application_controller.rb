class ApplicationController < ActionController::Base
  protect_from_forgery
  attr_writer :conference
  before_filter :redirect_to_login_page_unless_logged_in

  private

  def conference
    @conference ||= CONFERENCE
  end

  def redirect_to_login_page_unless_logged_in
    unless logged_in?
      session[:path] = request.path
      redirect_to :login
    end
  end

  def logged_in?
    session[:ein]
  end
end
