require_relative "../../lib/active_model/model"

class User
  include ActiveModel::Model
  expose_attributes :ein, :password
end
