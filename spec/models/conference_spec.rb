require "fast_spec_helper"
require_relative "../../app/models/conference"

describe Conference do
  describe "#new_session" do
    it "builds and returns a new session" do
      session = stub
      args = {foo: 42, bar: "baz"}
      session_factory = stub.tap {|sf| sf.stub(:build).with(args) { session } }
      subject.build_sessions_with ->(args){ session_factory.build args }
      subject.new_session(args).should == session
    end
  end

  describe "#suggest_session" do
    it "saves the session" do
      session = stub
      session_store = stub
      subject.persist_sessions_with session_store
      session_store.should_receive(:save).with(session)
      subject.suggest_session session
    end
  end

  describe "#sessions" do
    it "returns a list of suggested sessions" do
      sessions = stub
      session_store = stub all: sessions
      subject.persist_sessions_with session_store
      subject.sessions.should == sessions
    end
  end
end
