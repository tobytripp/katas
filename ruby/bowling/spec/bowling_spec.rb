require "spec_helper"

require "game"

RSpec.describe Game do
  subject(:game) { Game.new }

  it "scores zero for a gutter game" do
    20.times { game.roll 0 }
    expect( game.score ).to eq 0
  end

  it "scoring all ones gives a score of 20" do
    20.times { game.roll 1 }
    expect( game.score ).to eq 20
  end

  it "scoring one spare, you get the next roll as a bonus" do
    game.roll 5
    game.roll 5
    game.roll 3
    17.times { game.roll 0 }
    expect( game.score ).to eq 16
  end

  it "all spares" do
    21.times { game.roll 5 }
    expect( game.score ).to eq 150
  end

  it "when scoring a strike, you get the next two rolls as bonus" do
    game.roll 10
    game.roll 3
    game.roll 4
    16.times { game.roll 0 }
    expect( game.score ).to eq 24
  end

  it "8/2 frame spares" do
    10.times {
      game.roll 8
      game.roll 2
    }
    game.roll 3
    expect( game.score ).to eq 175
  end

  it "scores 300 on a perfect game" do
    12.times { game.roll 10 }
    expect( game.score ).to eq 300
  end
end
