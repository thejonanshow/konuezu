# live < 2, die
# live 2/3, live
# live with > 3, die
# dead with == 3, spawn

require 'game_of_life'

class Cell
  def initialize
    @state = false
  end

  def alive?
    @state
  end

  def dead?; !alive? end

  def should_die?
    case neighbors.length
    when 0, 1
      true
    else
      false
    end
  end
end

class World
end
