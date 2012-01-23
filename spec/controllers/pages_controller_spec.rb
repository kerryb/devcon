require "spec_helper"

describe PagesController do
  describe "#home" do
    let(:proposals) { stub }
    before { Proposal.stub all: proposals }

    it "assigns the proposals" do
      get :home
      assigns[:proposals].should == proposals
    end
  end
end
