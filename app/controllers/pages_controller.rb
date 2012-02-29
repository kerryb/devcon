class PagesController < ApplicationController
  def home
    @proposals = CONFERENCE.proposals
  end
end
