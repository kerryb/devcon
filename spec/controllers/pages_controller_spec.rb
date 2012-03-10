require "spec_helper"

describe PagesController do
  describe "#home" do
    it "assigns the conference" do
      get :home
      assigns[:conference].should == CONFERENCE
    end
  end
end
