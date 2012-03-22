require_relative "model"

class User
  include Model
  expose_attributes :ein, :password
end
