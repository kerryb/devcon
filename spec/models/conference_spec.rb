require "fast_spec_helper"
require_relative "../../app/models/conference"

describe Conference do
  describe "#new_session" do
    let(:session) { mock }
    before { subject.build_sessions_with ->(args){ session } }

    it "builds and returns a new session" do
      subject.new_session.should == session
    end

    it "accepts a hash of attributes" do
      args = {foo: 42, bar: "baz"}
      session_factory = stub build: true
      subject.build_sessions_with ->(args){ session_factory.build args }
      session_factory.should_receive(:build).with(args)
      subject.new_session args
    end
  end

  describe "#sessions" do
    let(:session_0) { stub submit: true }
    let(:session_1) { stub }
    let(:sessions) { [session_0, session_1] }
    before do
      subject.build_sessions_with ->(args){ sessions[args] }
      subject.suggest_session(subject.new_session(0))
      subject.new_session(1)
    end

    it "returns a list of suggested sessions" do
      subject.sessions.should == [session_0]
    end
  end
end
