require "fast_spec_helper"
stub_active_model
require_relative "../../app/models/proposal"

describe Proposal do
  it "has a title" do
    subject.title = "foo"
    subject.title.should == "foo"
  end
end
