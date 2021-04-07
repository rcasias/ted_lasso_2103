class League
  attr_reader :name,
              :teams

  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    @teams.map do |team|
      team.captain_instance
    end
  end

  def players_by_team
    @teams.each_with_object({}) do |team, hash|
      hash[team] = team.players.map do |player|
        player.name
      end
    end
  end
  # require'pry';binding.pry

end
