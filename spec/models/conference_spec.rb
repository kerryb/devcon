require "fast_spec_helper"
require "conference"

describe Conference do
  describe "#new_proposal" do
    let(:proposal) { mock }
    before { subject.build_proposals_with ->(args){ proposal } }

    it "builds and returns a new proposal" do
      subject.new_proposal.should == proposal
    end

    it "accepts a hash of attributes" do
      args = {foo: 42, bar: "baz"}
      proposal_factory = mock.stub build: true
      subject.build_proposals_with ->(args){ proposal_factory.build args }
      subject.new_proposal args
      proposal_factory.should_have_received(:build).with(args)
    end
  end

  describe "#proposals" do
    let(:proposal_0) { mock submit: true }
    let(:proposal_1) { mock }
    let(:proposals) { [proposal_0, proposal_1] }
    before do
      subject.build_proposals_with ->(args){ proposals[args] }
      subject.submit_proposal(subject.new_proposal(0))
      subject.new_proposal(1)
    end

    it "returns a list of submitted proposals" do
      subject.proposals.should == [proposal_0]
    end
  end
end
