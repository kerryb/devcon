require "spec_helper"

describe SessionStore do
  before { Mongo.db[:sessions].remove }

  describe ".save" do
    it "saves a session record" do
      session = Session.new title: "Foo"
      SessionStore.save session
      Mongo.db[:sessions].find_one["title"].should == "Foo"
    end
  end

  describe ".all" do
    it "returns all session records" do
      Mongo.db[:sessions].save(title: "Foo")
      Mongo.db[:sessions].save(title: "Bar")
      SessionStore.all.map(&:title).should == %w{Foo Bar}
    end
  end
end
