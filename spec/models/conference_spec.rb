require File.expand_path("../../../app/models/conference", __FILE__)

describe Conference do
  describe "#proposals" do
    let(:proposals) { stub }
    before { Proposal.stub all: proposals }

    it "returns all proposals" do
      subject.proposals.should == proposals
    end
  end
end
