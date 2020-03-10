# ./spec/game_spec.rb
require_relative '../lib/game'
RSpec.describe Game do
  describe "#switch_player" do
    it "switches the current player and returns true" do
      game = Game.new
      game.switch_player
      expect(game.current_player).to eql('0') 
    end
  end

  describe "#two_d_array" do
    it "returns a two dimensional array" do
      game = Game.new
      expect(game.two_d_array).to be_an(Array)
    end
  end

  describe "#winner?" do
    it "returns true when there's a winner column, row or diagonal" do
      game = Game.new
      ar = [['X', '0', nil], ['X', '0', nil], ['X', '0', nil]]
      game.win_col?(ar,0)
      expect(game.winner?(1)).to be_truthy
    end
  end

  describe "#win_col?" do
    it "returns true if the column is a winner column" do
      game = Game.new
      ar = [['X', '0', nil], ['X', '0', nil], ['X', '0', nil]]
      expect(game.win_col?(ar,0)).to be_truthy
    end
  end

  describe "#win_row?" do
    it "returns true if the row is a winner row" do
      game = Game.new
      ar = [['X', '0', nil], %w[X X X], ['X', '0', nil]]
      expect(game.win_row?(ar,1)).to be_truthy
    end
  end

  describe "#win_diag1?" do
    it "returns true if the diagonal is a winner diagonal" do
      game = Game.new
      ar = [['X', '0', nil], ['0', 'X', nil], [nil, '0', 'X']]
      expect(game.win_diag1?(ar, 0, 0)).to be_truthy
    end
  end

  describe "#win_diag2?" do
    it "returns true if the diagonal is a winner diagonal" do
      game = Game.new
      ar = [[nil, '0', 'X'], ['0', 'X', nil], ['X', '0', nil]]
      expect(game.win_diag2?(ar, 1, 1)).to be_truthy
    end
  end

  describe "#reset" do
    it "creates a new board for the game" do
      game = Game.new
      game.reset
      expect(game.board.positions.all?(nil)).to be_truthy
    end
  end

  describe "#display_scores" do
    it "display the current_scores" do
      game = Game.new
      game.players['X'].name = 'A'
      game.players['0'].name = 'B'
      expect(game.display_scores).to eql('A: 0 - B: 0')
    end
  end

end