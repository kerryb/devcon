class Proposal
  attr_reader :title

  def initialize title
    @title = title
  end

  def self.all
    [new("How to run a DevCon"), new("Robot battles")]
  end
end
