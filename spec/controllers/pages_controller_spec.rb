require "spec_helper"

describe PagesController do
  describe "#home" do
    let(:proposals) { stub }
    before { CONFERENCE.stub proposals: proposals }

    it "assigns the proposals" do
      get :home
      assigns[:proposals].should == proposals
    end
  end
end
