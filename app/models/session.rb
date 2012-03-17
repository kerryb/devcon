require_relative "../../lib/active_model/model"

class Session
  include ActiveModel::Model
  attr_accessor :title, :description

  def attributes
    {title: title, description: description}
  end

  def save
    session_store.save self
  end

  def persist_with store
    @session_store = store
  end

  private
  def session_store
    @session_store ||= SessionStore
  end
end
