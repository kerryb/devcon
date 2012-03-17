require_relative "../../lib/active_model/model"

class Session
  include ActiveModel::Model
  attr_accessor :title, :description, :created_at

  def attributes
    {title: title, description: description, created_at: created_at}
  end

  def create_record
    self.created_at = clock.call
    session_store.save self
  end

  def persist_with store
    @session_store = store
  end

  def timestamp_with clock
    @clock = clock
  end

  private

  def session_store
    @session_store ||= SessionStore
  end

  def clock
    @clock ||= Time.public_method(:now)
  end
end
