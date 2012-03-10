class PagesController < ApplicationController
  def home
    @conference = CONFERENCE.tap do |c|
      c.submit_proposal(c.new_proposal(title: "How to run a DevCon"))
      c.submit_proposal(c.new_proposal(title: "Robot battles"))
    end
  end
end
