require "fast_spec_helper"
stub_active_model
require_relative "../../app/models/session"

describe Session do
  subject { Session.new title: "A session", description: "A boring talk" }

  its(:title) { should == "A session" }
  its(:description) { should == "A boring talk" }
  its(:attributes) { should == {title: "A session", description: "A boring talk"} }

  describe "#save" do
    it "persists the session" do
      session_store = stub
      subject.persist_with session_store
      session_store.should_receive(:save).with subject
      subject.save
    end
  end
end
