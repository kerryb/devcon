require File.expand_path("../proposal", __FILE__)

class Conference
  def proposals
    Proposal.all
  end
end
