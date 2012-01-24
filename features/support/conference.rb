module ConferenceStepHelper
  def conference
    @conference ||= Conference.new
  end
end
World ConferenceStepHelper
