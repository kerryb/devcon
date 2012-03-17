require "fast_spec_helper"
require_relative "../../app/models/conference"

describe Conference do
  let(:session) { stub }

  describe "#new_session" do
    let(:session_factory) { stub.tap {|sf| sf.stub(:build).with(attrs) { session } } }
    let(:attrs) { stub }
    before { subject.build_sessions_with ->(attrs){ session_factory.build attrs } }

    it "builds and returns a new session with the supplied attributes" do
      subject.new_session(attrs).should == session
    end
  end

  describe "#suggest_session" do
    it "saves the session" do
      session.should_receive :save
      subject.suggest_session session
    end
  end

  describe "#sessions" do
    it "returns all sessions" do
      sessions = stub
      session_store = stub all: sessions
      subject.persist_sessions_with session_store
      subject.sessions.should == sessions
    end
  end
end
