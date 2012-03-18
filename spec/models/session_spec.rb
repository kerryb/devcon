require "fast_spec_helper"
stub_active_model
require_relative "../../app/models/session"

describe Session do
  describe "attributes" do
    let(:attrs) { {title: "A session", description: "A boring talk",
                   created_at: Time.now} }
    subject { Session.new attrs.merge({extra: "should be ignored"}) }

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
