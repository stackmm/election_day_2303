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
  end
end