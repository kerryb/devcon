require "fast_spec_helper"
require "conference"

describe Conference do
  describe "#proposals" do
    let(:proposals) { stub }
    before { Proposal.stub all: proposals }

    it "returns all proposals" do
      subject.proposals.should == proposals
    end
  end
end
