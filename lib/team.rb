class Team
  attr_reader :name,
              :couch,
              :players
  def initialize(name, couch, players)
    @name = name
    @couch = couch
    @players = players
  end

  def total_salary
    @players.sum do |player|
      player.salary
    end
  end

  def captain_instance
    name = @players.max_by do |player|
      player.salary
    end
  end

  def captain
    captain_instance.name
  end

  def positions_filled
    positions_array = []
    @players.each do |player|
      positions_array << player.position
    end
    positions_array
  end
end
