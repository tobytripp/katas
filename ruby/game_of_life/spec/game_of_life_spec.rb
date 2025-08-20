require "game_of_life"

RSpec.describe GameOfLife do
  subject(:game) { described_class.new universe }

  describe "#step" do
    context "empty cells" do
      let(:universe) do
        [[0, 0, 0],
         [0, 0, 0],
         [0, 0, 0]]
      end

      it "remain empty" do
        game.step
        expect( game.state ).to eq universe
      end
    end

    context "any live cell with fewer than two neighbors" do
      let(:universe) do
        [[1, 0, 0],
         [0, 0, 0],
         [0, 0, 0]]
      end

      it "dies, as if by under population" do
        game.step
        expect( game.state ).to eq [[0, 0, 0],
                                    [0, 0, 0],
                                    [0, 0, 0]]
      end
    end

    context "any live cell with two neighbors" do
      let(:universe) do
        [[1, 1, 0, 0],
         [0, 0, 1, 0],
         [0, 0, 0, 0],
         [0, 0, 0, 0]]
      end

      it "lives on to the next generation" do
        game.step
        expect( game.state ).to eq [[0, 1, 0, 0],
                                    [0, 1, 0, 0],
                                    [0, 0, 0, 0],
                                    [0, 0, 0, 0]]
      end
    end

    context "any live cell with three neighbors" do
      let(:universe) do
        [[1, 0, 1, 0, 0],
         [0, 1, 0, 0, 0],
         [0, 1, 0, 0, 0],
         [0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0]]
      end

      it "lives on to the next generation" do
        game.step
        expect( game.state ).to eq [[0, 1, 0, 0, 0],
                                    [1, 1, 1, 0, 0],
                                    [0, 0, 0, 0, 0],
                                    [0, 0, 0, 0, 0],
                                    [0, 0, 0, 0, 0]]
      end
    end

    context "any dead cell with exactly three neighbors" do
      let( :universe )do
        [[1, 0, 1, 0],
         [0, 1, 0, 0],
         [0, 0, 0, 0],
         [0, 0, 0, 0]]
      end

      it "becomes a live cell, as if by reproduction" do
        game.step
        expect( game.state ).to eq [[0, 1, 0, 0],
                                    [0, 1, 0, 0],
                                    [0, 0, 0, 0],
                                    [0, 0, 0, 0]]
      end
    end

    context "glider" do
      let( :universe )do
        [[0, 1, 0, 0, 0, 0],
         [0, 0, 1, 0, 0, 0],
         [1, 1, 1, 0, 0, 0],
         [0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0],
         [0, 0, 0, 0, 0, 0]]
      end

      it "moves" do
        game.step

        expect( game.state ).to eq [[0, 0, 0, 0, 0, 0],
                                    [1, 0, 1, 0, 0, 0],
                                    [0, 1, 1, 0, 0, 0],
                                    [0, 1, 0, 0, 0, 0],
                                    [0, 0, 0, 0, 0, 0],
                                    [0, 0, 0, 0, 0, 0]]
      end
    end
  end
end
