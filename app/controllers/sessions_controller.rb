class SessionsController < ApplicationController
  def new
    @session = CONFERENCE.new_session
  end

  def create
    @session = CONFERENCE.new_session params[:session]
    CONFERENCE.suggest_session(@session)
    redirect_to :root
  end
end
