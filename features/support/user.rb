module UserStepHelper
  def user
    @user ||= User.new
  end
end
World UserStepHelper
