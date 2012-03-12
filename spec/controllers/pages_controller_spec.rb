require "spec_helper"

describe PagesController do
  let(:conference) { stub }
  before { subject.conference = conference }

  describe "#home" do
    it "assigns the conference" do
      get :home
      assigns[:conference].should == conference
    end
  end
end
