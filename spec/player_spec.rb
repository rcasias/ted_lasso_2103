require 'rspec'
require './lib/player'

RSpec.describe Player do
  it 'exists' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})

    expect(roy).to be_a Player
  end

  it 'has attributes' do
    roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})

    expect(roy.name).to eq("Roy Kent")
    expect(roy.position).to eq("Center Midfielder")
    expect(roy.salary).to eq(1_000_000)
  end
end  
