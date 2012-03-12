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
