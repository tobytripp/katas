module Cell
  ALIVE = 1
  DEAD  = 0
  refine Integer do
    def alive?
      self == ALIVE
    end

    def dead?
      self == DEAD
    end
  end
end

class GameOfLife
  using Cell
  attr_reader :universe

  def initialize(universe)
    @universe = universe
  end

  def step()
    @universe = universe.map.with_index do |row, i|
      row.map.with_index do |cell, j|
        neighbors = neighbors_of i, j
        if neighbors < 2
          Cell::DEAD
        elsif cell.dead? && neighbors == 3
          Cell::ALIVE
        elsif cell.alive? && (neighbors == 2 || neighbors == 3)
          Cell::ALIVE
        else
          Cell::DEAD
        end
      end
    end
  end

  def state()
    universe
  end

  def print()
    state.each do |row|
      puts row.inspect
    end
  end

  private

  # Counts neighbors of i,j in a wrapping grid.
  #
  def neighbors_of( i, j )
    n = []
    next_column = (j+1) % universe[i].length
    n.concat [universe[i-1][j-1], universe[i-1][j], universe[i-1][next_column]]
    n.concat [universe[i][j-1], universe[i][next_column]]
    next_row = (i+1) % universe.length
    n.concat [universe[next_row][j-1], universe[next_row][j], universe[next_row][next_column]]
    n.sum
  end
end

if $PROGRAM_NAME == __FILE__
  game = GameOfLife.new [[0, 1, 0, 0, 0, 0, 0],
                         [0, 0, 1, 0, 0, 0, 0],
                         [1, 1, 1, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0]]
  while true
    puts "\e[H\e[2J"
    game.print
    game.step
    sleep 0.3
  end
end
