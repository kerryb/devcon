require "fast_spec_helper"
require "proposal"

describe Proposal do
  subject { Proposal.new title: "foo" }

  it "has a title" do
    subject.title.should == "foo"
  end
end
