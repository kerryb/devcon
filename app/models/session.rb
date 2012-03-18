require_relative "../../lib/active_model/model"

class Session
  include ActiveModel::Model

  expose_attributes :title, :description, :created_at

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
