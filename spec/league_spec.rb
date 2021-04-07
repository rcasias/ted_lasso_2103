require 'rspec'
require './lib/player'
require './lib/team'
require './lib/league'

RSpec.describe League do
  it 'exists' do
    premier = League.new("Premier League")

    expect(premier).to be_a League
  end

  it 'has attributes' do
    premier = League.new("Premier League")

    expect(premier.name).to eq("Premier League")
    expect(premier.teams).to eq([])
  end

  context 'methods' do
    it 'can add teams to the league' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.teams).to eq([richmond, manchester])
    end

    it 'can find team captains' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.captains).to eq([roy, fernandinho])
    end

    it 'can find team positions' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
      premier.add_team(richmond)
      premier.add_team(manchester)

      result = {
        richmond => ["Roy Kent", "Sam Obisanya"],
        manchester => ["Jamie Tartt", "Fernandinho"]
      }

      expect(premier.players_by_team).to eq(result)
    end

    it 'can find team positions' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      phil = Player.new({name: "Phil", position: "Midfielder", salary: 5_200_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam, phil])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      nick = Player.new({name: "Nick", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho, nick])
      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.most_expensive_player).to eq(["Phil", "Fernandinho", "Nick"])
    end
  end
end
