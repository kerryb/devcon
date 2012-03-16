require "spec_helper"

describe SessionStore do
  before { Mongo.db[:sessions].remove }
  let(:session_1) { Session.new title: "t1", description: "d1" }
  let(:session_2) { Session.new title: "t2", description: "d2" }

  describe ".save" do
    it "saves a session record" do
      SessionStore.save session_1
      Session.new(Mongo.db[:sessions].find_one).should == session_1
    end
  end

  describe ".all" do
    it "returns all session records" do
      Mongo.db[:sessions].save(session_1.attributes)
      Mongo.db[:sessions].save(session_2.attributes)
      SessionStore.all.should == [session_1, session_2]
    end
  end
end
