class Game
  attr_reader :pins

  def initialize()
    @pins = []
  end

  def roll( pins )
    @pins << pins
  end

  def score()
    do_score pins
  end

  def do_score(n)
    return n.sum if n.count <= 3
    x, y, z = n
    if x == 10
      x + y + z + do_score( n[1..] )
    elsif x + y == 10
      x + y + z + do_score( n[2..] )
    else
      x + y + do_score( n[2..] )
    end
  end
end
