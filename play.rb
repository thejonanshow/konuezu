
# "💀😁"

class Board
  DEAD = ?_
  LIVE = ?L

  def initialize
    @size = 20
    @cells = Array.new(@size){ Array.new(@size){DEAD} }
    5.times { |i| @cells[i][i] = LIVE }
  end

  def show
    puts "\e[H\e[2J"
    puts "v" * @size
    @size.times{|y|
      @size.times{|x|
        print @cells[y][x]
      }
      puts
    }
    puts "^" * @size
  end

  def count_neb_lives py, px
    lives = 0
    (py-1).step(to: py+1){|y|
      (px-1).step(to: px+1){|x|
        next if y < 0
        next if x < 0
        next if y >= @size
        next if x >= @size
        next if px == x && py == y
        lives += 1 if @cells[y][x] == LIVE
      }
    }
    lives
  end

  def step
    @size.times{|y|
      @size.times{|x|
        liveness = @cells[y][x] == LIVE
        neb_lives = count_neb_lives(y, x) 
        if liveness
          case
          when neb_lives < 2
            @cells[y][x] = DEAD
          when (lives == 2 || lives == 3)
            # ignore
          else
            @cells[y][x] = DEAD
          end
        else
          if neb_lives == 3
            @cells[y][x] = LIVE
          end
        end
      }
    }
  end
end

b = Board.new

2.times{|gen|
  sleep 0.1
  b.show
  puts "Generation #{gen}"
  b.step
}




