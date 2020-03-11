# ./spec/game_spec.rb
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'
RSpec.describe Game do
  let(:game) { Game.new }

  describe '#switch_player' do
    it 'switches the current player and returns true' do
      game.switch_player
      expect(game.current_player).to eql '0'
    end
  end

  describe '#two_d_array' do
    it 'returns a two-dimensional array from the positions' do
      game.board.store_position('1', 'X')
      game.board.store_position('2', '0')
      game.board.store_position('3', 'X')
      game.board.store_position('4', '0')
      game.board.store_position('5', 'X')
      game.board.store_position('6', '0')
      game.board.store_position('7', 'X')
      game.board.store_position('8', '0')
      game.board.store_position('9', 'X')
      expect(game.two_d_array).to eql([%w[X 0 X], %w[0 X 0], %w[X 0 X]])
    end
  end

  describe '#winner?' do
    it 'returns true when there is a winner column, row or diagonal' do
      ar = [['X', '0', nil], ['X', '0', nil], ['X', '0', nil]]
      game.win_col?(ar, 0)
      expect(game.winner?(1)).to be true
    end
  end

  describe '#win_col?' do
    it 'returns true if the column is a winner column' do
      ar = [['X', '0', nil], ['X', '0', nil], ['X', '0', nil]]
      expect(game.win_col?(ar ,0)).to be true
    end
  end

  describe '#win_row?' do
    it 'returns true if the row is a winner row' do
      ar = [['X', '0', nil], %w[X X X], ['X', '0', nil]]
      expect(game.win_row?(ar, 1)).to be true
    end
  end

  describe '#win_diag1?' do
    it 'returns true if the diagonal is a winner diagonal' do
      ar = [['X', '0', nil], ['0', 'X', nil], [nil, '0', 'X']]
      expect(game.win_diag1?(ar, 0, 0)).to be true
    end
  end

  describe '#win_diag2?' do
    it 'returns true if the diagonal is a winner diagonal' do
      ar = [[nil, '0', 'X'], ['0', 'X', nil], ['X', '0', nil]]
      expect(game.win_diag2?(ar, 1, 1)).to be true
    end
  end

  describe '#reset' do
    it 'creates a new empty board for the game' do
      game.reset
      expect(game.board.positions.all?(nil)).to be true
    end
  end

  describe '#display_scores' do
    it 'display the current_scores' do
      game.players['X'].name = 'A'
      game.players['0'].name = 'B'
      expect(game.display_scores).to eql 'A: 0 - B: 0'
    end
  end
end

RSpec.describe Board do
  let(:board) { Board.new }

  describe '#store_position' do
    it 'place the mark of the player in the given position' do
      board.store_position('1', 'X')
      expect(board.positions[0]).to eql 'X'
    end
  end

  describe '#full?' do
    it 'returns true if all the positions of the board are full' do
      board.store_position('1', 'X')
      board.store_position('2', '0')
      board.store_position('3', 'X')
      board.store_position('4', '0')
      board.store_position('5', 'X')
      board.store_position('6', '0')
      board.store_position('7', 'X')
      board.store_position('8', '0')
      board.store_position('9', 'X')
      expect(board.full?).to be true
    end
  end

  describe '#taken?' do
    it 'returns true if the given position is already set' do
      board.store_position('1', '0')
      expect(board.taken?('1')).to be true
    end
  end

  describe '#line?' do
    it 'returns true if the given position is part of a line' do
      expect(board.line?(20)).to be true
    end
  end

  describe '#pick_string' do
    it 'returns spaces for an empty space in the big board' do
      expect(board.pick_string(37)).to eql '  '
    end

    it 'returns two underscores if the number corresponds to a line' do
      expect(board.pick_string(20)).to eql '__'
    end

    it 'returns a string with the position for a number in a number placeholder' do
      expect(board.pick_string(31)).to eql ' 5'
    end

    it 'returns a string with the mark corresponding to the number in a mark placeholder' do
      board.store_position(1, 'X')
      expect(board.pick_string(11)).to eql ' X'
    end
  end

  describe '#number_placeholder?' do
    it 'returns true if the number corresponds to a number place' do
      expect(board.number_placeholder?(61)).to be true
    end
  end

  describe '#mark_placeholder?' do
    it 'returns true if the number corresponds to a mark place' do
      expect(board.mark_placeholder?(41)).to be true
    end
  end

  describe '#number' do
    it 'returns the string with the position for a number on the big board' do
      expect(board.number(4)).to eql ' 2'
    end
  end

  describe '#mark' do
    it 'returns the string with the mark for a number on the big board, or spaces if empty' do
      expect(board.mark(11)).to eql '  '
    end
  end
end

RSpec.describe Player do
  describe '#increase_score' do
    it 'increases player score by 1' do
      player = Player.new('A', 'X')
      player.increase_score
      expect(player.score).to eql(1)
    end
  end
end
