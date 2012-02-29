require File.expand_path("../proposal", __FILE__)

class Conference
  def proposals
    [Proposal.new("How to run a DevCon"), Proposal.new("Robot battles")]
  end
end
