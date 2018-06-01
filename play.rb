# live < 2, die
# live 2/3, live
# live with > 3, die
# dead with == 3, spawn

class Chicken
  attr_reader :eggs

  def initialize
    @eggs = []
  end

  def add(egg)
    eggs << egg
  end

  def to_s
    chompy_eggs = eggs.dup

    the_last_eggbender_y = nil

    while !chompy_eggs.empty?
      eggbender = chompy_eggs.shift

      if the_last_eggbender_y && the_last_eggbender_y != eggbender.y
        (eggbender.y - the_last_eggbender_y - 1).times { puts "\n" }
      end

      eggbender
    end

    "000    0 0  00 "
  end
end

class Egg
  attr_reader :x, :y

  def initialize(x: x, y: y)
    @x = x
    @y = y
  end

  def <=>(other_egg)
    if other_egg.y == self.y
      self.x <=> other_egg.x
    else
      self.y <=> other_egg.y
    end
  end
end

chx = Chicken.new
3.times { |i| chx.add(Egg.new(x: i, y: 0)) }

puts chx













