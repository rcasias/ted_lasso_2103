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

  def most_expensive_player
    most_array = []
    @teams.each do |team|
      team.players.each do |player|
        if most_array.empty?
          most_array << player
        elsif most_array[0].salary < player.salary
          most_array.clear
          most_array << player
        else most_array[0].salary == player.salary
          most_array << player
        end
      end
    end
    most_array.map do |player|
      player.name
    end
  end
  # require'pry';binding .pry

end
