class Race 
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(attributes)
    candidate = Candidate.new(attributes)
    @candidates << candidate
    candidate
  end

end