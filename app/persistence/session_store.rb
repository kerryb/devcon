module SessionStore
  def self.save session
    Mongo.db[:sessions].save(title: session.title, description: session.description)
  end

  def self.all
    Mongo.db[:sessions].find.map {|s| Session.new title: s["title"], description: s["description"] }
  end
end
