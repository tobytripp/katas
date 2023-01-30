class GameOfLife
  attr_reader :universe

  def initialize(universe)
    @universe = universe
  end

  def step()
    next_universe = Array.new(universe.length) { Array.new universe[0].length }
    (0..universe.length-1).each do |i|
      (0..universe[i].length-1).each do |j|
        neighbors = neighbors_of i, j
        if neighbors < 2
          next_universe[i][j] = 0
        elsif universe[i][j] < 1 && neighbors == 3
          next_universe[i][j] = 1
        elsif universe[i][j] > 0 && (neighbors == 2 || neighbors == 3)
          next_universe[i][j] = 1
        else
          next_universe[i][j] = 0
        end
      end
    end
    @universe = next_universe
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
  game = GameOfLife.new [[0, 1, 0, 0, 0, 0],
                         [0, 0, 1, 0, 0, 0],
                         [1, 1, 1, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0]]
  while true
    puts "\e[H\e[2J"
    game.print
    game.step
    sleep 0.3
  end
end
