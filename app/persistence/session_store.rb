module SessionStore
  def self.save session
    Mongo.db[:sessions].save(session.attributes)
  end

  def self.all
    Mongo.db[:sessions].find.map {|s| Session.new s }
  end
end
