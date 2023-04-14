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
end