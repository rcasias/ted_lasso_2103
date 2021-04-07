class Player
  attr_reader :name,
              :position,
              :salary
  def initialize(player)
    @name = player[:name]
    @position = player[:position]
    @salary = player[:salary]
  end
end
