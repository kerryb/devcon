require_relative "../../lib/active_model/model"

class Session
  include ActiveModel::Model
  attr_accessor :title, :description

  def attributes
    {title: title, description: description}
  end
end
