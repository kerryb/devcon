class Conference
  attr_reader :proposals

  def initialize
    @proposals = []
  end

  def build_proposals_with factory
    @proposal_factory = factory
  end

  def new_proposal args = {}
    proposal_factory.call args
  end

  def submit_proposal proposal
    @proposals << proposal
  end

  private
  def proposal_factory
    @proposal_factory ||= Proposal.public_method(:new)
  end
end
