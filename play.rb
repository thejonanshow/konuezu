class Grid
  def initialize(width:, height:, state: "")
    @height = height
    @width = width

    rows = state.split("\n")

    # @grid[y][x]
    @grid = Array.new(height) { |y| Array.new(width) { |x| Cell.new((rows[y] || "")[x] || " ") } }
  end

  def to_s
    @grid.map(&:join).join("\n")
  end

  def neighbors(x, y)
    return enum_for(:neighbors, x, y) unless block_given?

    [-1, 0, 1].each do |xo|
      [-1, 0, 1].each do |yo|
        next if xo == 0 && yo == 0
        next if x + xo == @width
        next if y + yo == @height
        next if x + xo < 0
        next if y + yo < 0
        
        yield x + xo, y + yo
      end
    end
  end

  def step
    new_grid = @grid.map { |row| row.map(&:dup) }

    @grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        count = neighbors(x, y).count do |nx, ny|
          @grid[ny][nx].alive?
        end

# live < 2, die
# live 2/3, live
# live with > 3, die
# dead with == 3, spawn

        new_grid[y][x].alive = case count
                               when 2
                                 @grid[y][x].alive?
                               when 3
                                 true
                               else
                                 false
                               end
      end
    end

    @grid = new_grid
  end
end

class Cell
  def initialize(state)
    @state = state
  end

  def to_s
    @state
  end

  def alive?
    @state == "#"
  end

  def alive=(value)
    if value
      @state = "#"
    else
      @state = " "
    end
  end
end

world = Grid.new(width: 10, height: 10, state: <<STATE)

### ###

STATE

puts world
world.step
puts "-----"
puts world

