require 'rspec'
require './lib/candidate'

RSpec.describe Candidate do
  it "exists" do
    diana = Candidate.new({name: "Diana D", party: :democrat})
    expect(diana).to be_an_instance_of(Candidate)
  end

  it "has attributes" do
    diana = Candidate.new({name: "Diana D", party: :democrat})
    expect(diana.name).to eq("Diana D")
    expect(diana.party).to eq(:democrat)
    expect(diana.votes).to eq(0)
  end
end