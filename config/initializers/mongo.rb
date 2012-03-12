module Mongo
  def self.db
    @db ||= connection.db(Rails.application.config.mongo_db).tap do |db|
      if Rails.application.config.respond_to?(:mongo_username)
        db.authenticate Rails.application.config.mongo_username, Rails.application.config.mongo_password
      end
    end
  end

  def self.connection
    @connection ||= Mongo::Connection.new(Rails.application.config.mongo_host,
                                          Rails.application.config.mongo_port)
  end
  private_class_method :connection
end
