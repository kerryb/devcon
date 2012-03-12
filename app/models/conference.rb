class Conference
  def new_session args = {}
    session_factory.call args
  end

  def suggest_session session
    session_store.save session
  end

  def sessions
    session_store.all
  end

  def build_sessions_with factory
    @session_factory = factory
  end

  def persist_sessions_with store
    @session_store = store
  end

  private
  def session_factory
    @session_factory ||= Session.public_method(:new)
  end

  def session_store
    @session_store ||= SessionStore
  end
end
