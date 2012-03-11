class PagesController < ApplicationController
  def home
    @conference = CONFERENCE.tap do |c|
      c.suggest_session(c.new_session(title: "How to run a DevCon"))
      c.suggest_session(c.new_session(title: "Robot battles"))
    end
  end
end
