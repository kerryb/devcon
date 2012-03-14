require "fast_spec_helper"
stub_active_model
require_relative "../../app/models/session"

describe Session do
  subject { Session.new title: "A session", description: "A boring talk" }

  its(:title) { should == "A session" }
  its(:description) { should == "A boring talk" }
end
