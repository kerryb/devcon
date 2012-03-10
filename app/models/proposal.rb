class Proposal
  attr_reader :title

  def initialize attrs
    @title = attrs[:title]
  end
end
