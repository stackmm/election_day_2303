class Race 
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @is_open = true
  end

  def register_candidate!(attributes)
    candidate = Candidate.new(attributes)
    @candidates << candidate
    candidate
  end

  def open?
    @is_open
  end

  def close!
    @is_open = false
  end

end