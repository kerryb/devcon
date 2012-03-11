class Conference
  attr_reader :sessions

  def initialize
    @sessions = []
  end

  def build_sessions_with factory
    @session_factory = factory
  end

  def new_session args = {}
    session_factory.call args
  end

  def suggest_session session
    @sessions << session
  end

  private
  def session_factory
    @session_factory ||= Session.public_method(:new)
  end
end
