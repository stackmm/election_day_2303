require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  it "exists" do
    election1 = Election.new("2024")
    expect(election1).to be_an_instance_of(Election)
  end

  it "has attributes" do
    election1 = Election.new("2024")
    expect(election1.year).to eq("2024")
    expect(election1.races).to eq([])
  end

  it "can add races to an election" do
    election1 = Election.new("2024")
    expect(election1.races).to eq([])

    race1 = Race.new("Presidency")
    race2 = Race.new("Senator")
    election1.add_race(race1)
    election1.add_race(race2)
    expect(election1.races).to eq([race1, race2])
  end

  it "can list all the candidates in an election" do
    election1 = Election.new("2024")
    race1 = Race.new("Presidency")
    race2 = Race.new("Senator")
    candidate1 = race1.register_candidate!({name: "Joe Biden", party: :democrat})
    candidate2 = race1.register_candidate!({name: "Donald Trump", party: :republican})
    candidate3 = race2.register_candidate!({name: "Joe Schmo", party: :democrat})
    candidate4 = race2.register_candidate!({name: "Jane Doe", party: :republican})
    election1.add_race(race1)
    election1.add_race(race2)
    expect(election1.candidates).to eq([candidate1, candidate2, candidate3, candidate4])
  end
end