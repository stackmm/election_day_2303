class Race 
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(attributes)
    candidate = Candidate.new(attributes)
    @candidates << candidate
    candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    return false if open?

    # iterates through all candidates and determines the highest # of votes received
    most_votes = @candidates.map do |candidate|
      candidate.votes
    end.max

    # iterates through candidates and determines which candidate had the highest #
    winning_candidate = @candidates.find do |candidate|
      candidate.votes == most_votes
    end

    winning_candidate
  end

end