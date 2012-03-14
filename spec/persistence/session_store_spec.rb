require "spec_helper"

describe SessionStore do
  before { Mongo.db[:sessions].remove }

  describe ".save" do
    it "saves a session record" do
      session = Session.new title: "Foo", description: "Bar"
      SessionStore.save session
      record = Mongo.db[:sessions].find_one
      record["title"].should == "Foo"
      record["description"].should == "Bar"
    end
  end

  describe ".all" do
    it "returns all session records" do
      Mongo.db[:sessions].save(title: "t1", description: "d1")
      Mongo.db[:sessions].save(title: "t2", description: "d2")
      sessions = SessionStore.all
      sessions.map(&:title).should == %w{t1 t2}
      sessions.map(&:description).should == %w{d1 d2}
    end
  end
end
