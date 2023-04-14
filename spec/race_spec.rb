require 'rspec'
require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  it "exists" do
    race = Race.new("Texas Governor")
    expect(race).to be_an_instance_of(Race)
  end

  it "has attributes" do
    race = Race.new("Texas Governor")
    expect(race.office).to eq("Texas Governor")
    expect(race.candidates).to eq([])
  end

  it "can register a candidate #register_candidate!" do
    race = Race.new("Texas Governor")
    expect(race.candidates).to eq([])

    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    expect(candidate1.class).to eq(Candidate)
    expect(candidate1.name).to eq("Diana D")
    expect(candidate1.party).to eq(:democrat)
    expect(race.candidates).to eq([candidate1])

    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    expect(race.candidates).to eq([candidate1, candidate2])
  end

  it "can determine if a race is open or not #open?" do
    race = Race.new("Texas Governor")
    expect(race.open?).to be true
  end

  it "can close a race #close!" do
    race = Race.new("Texas Governor")
    expect(race.open?).to be true
    race.close!
    expect(race.open?).to be false
  end

  it "can determine which candidate has received the most votes #most_votes" do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    candidate1.vote_for!
    candidate1.vote_for!
    candidate1.vote_for!
    candidate1.vote_for!
    candidate2.vote_for!
    candidate2.vote_for!
    expect(race.most_votes).to eq(candidate1)
  end

  it "can determine the winner of a race #winner" do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    candidate1.vote_for!
    candidate1.vote_for!
    candidate1.vote_for!
    candidate1.vote_for!
    candidate2.vote_for!
    candidate2.vote_for!
    expect(race.winner).to be false
    race.close!
    expect(race.winner).to eq(candidate1)
  end

  it "can determine if there is a tie #tie?" do
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    candidate1.vote_for!
    candidate1.vote_for!
    candidate1.vote_for!
    candidate2.vote_for!
    candidate2.vote_for!
    candidate2.vote_for!
    expect(race.tie?).to be true

    race2 = Race.new("Texas Governor")
    candidate3 = race2.register_candidate!({name: "Diana D", party: :democrat})
    candidate4 = race2.register_candidate!({name: "Roberto R", party: :republican})
    candidate3.vote_for!
    candidate3.vote_for!
    candidate4.vote_for!
    expect(race2.tie?).to be false
    candidate4.vote_for!
    expect(race2.tie?).to be true
  end
end