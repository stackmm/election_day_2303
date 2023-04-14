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

  def most_votes
    @candidates.max_by do |candidate|
      candidate.votes
    end
  end

  def winner
    return false if open?
    most_votes
  end 

  def tie?
    max_num_of_votes = most_votes.votes

    num_candidate_with_max = @candidates.count do |candidate|
      candidate.votes == max_num_of_votes
    end

    num_candidate_with_max > 1
  end


end