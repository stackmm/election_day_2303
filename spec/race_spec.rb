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
  end
end