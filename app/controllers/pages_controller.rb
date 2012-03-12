class PagesController < ApplicationController
  def home
    @conference = conference
  end
end
