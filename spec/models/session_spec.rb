require "fast_spec_helper"
stub_active_model
require_relative "../../app/models/session"

describe Session do
  describe "attributes" do
    let(:timestamp) { Time.now }
    let(:attrs) { {title: "A session", description: "A boring talk",
                   created_at: timestamp} }
    subject { Session.new attrs }

    its(:title) { should == "A session" }
    its(:description) { should == "A boring talk" }
    its(:created_at) { should == timestamp }
    its(:attributes) { should == attrs }
  end

  describe "#create_record" do
    let(:session_store) { stub save: true }
    let(:timestamp) { Time.now }
    before do
      subject.persist_with session_store
      subject.timestamp_with ->{ timestamp }
    end

    it "timestamps the record" do
      subject.create_record
      subject.created_at.should == timestamp
    end

    it "persists the session" do
      session_store.should_receive(:save).with subject
      subject.create_record
    end
  end
end
