module Mongo
  def self.db
    @db ||= connection.db(Rails.application.config.mongo_db)
  end

  def self.connection
    @connection ||= Mongo::Connection.new(Rails.application.config.mongo_host,
                                          Rails.application.config.mongo_port)
  end
  private_class_method :connection
end
