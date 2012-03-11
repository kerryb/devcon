require_relative "../../lib/active_model/model"

class Proposal
  include ActiveModel::Model
  attr_accessor :title
end
