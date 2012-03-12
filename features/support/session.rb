module SessionStepHelper
  def sessions
    @sessions||= []
  end

  def suggest_session attrs
    conference.new_session(attrs).tap do |session|
      sessions << session
      conference.suggest_session session
    end
  end
end
World SessionStepHelper
