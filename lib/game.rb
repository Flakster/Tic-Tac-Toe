require_relative '../lib/board'
require_relative '../lib/player'

class Game
  attr_accessor :players, :board, :current_player, :continue
  def initialize
    @board = Board.new
    @players = {}
    @players['X'] = Player.new('Cross', 'X')
    @players['0'] = Player.new('Naught', '0')
    @current_player = 'X'
    @continue = true
  end

  def switch_player
    self.current_player = current_player == 'X' ? '0' : 'X'
  end

  def two_d_array
    ar = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    i = 0
    (0..2).each do |row|
      (0..2).each do |col|
        ar[row][col] = board.positions[i]
        i += 1
      end
    end
    ar
  end

  def winner?(pos)
    c = (pos.to_i - 1) % 3
    r = (pos.to_i - 1) / 3
    a = two_d_array
    if win_col?(a, c) || win_row?(a, r) || win_diag1?(a, c, r) || win_diag2?(a, c, r)
      true
    else
      false
    end
  end

  def win_col?(arr, col)
    if arr[0][col] == arr[1][col] && arr[1][col] == arr[2][col]
      true
    else
      false
    end
  end

  def win_row?(arr, row)
    if arr[row][0] == arr[row][1] && arr[row][1] == arr[row][2]
      true
    else
      false
    end
  end

  def win_diag1?(arr, col, row)
    if (row - col).zero? && arr[0][0] == arr[1][1] && arr[1][1] == arr[2][2]
      true
    else
      false
    end
  end

  def win_diag2?(arr, col, row)
    if row + col == 2 && arr[2][0] == arr[1][1] && arr[1][1] == arr[0][2]
      true
    else
      false
    end
  end

  def reset
    self.board = Board.new
    self.current_player = 'X'
    self.continue = true
  end

  def display_scores
    players['X'].name + ': ' + players['X'].score.to_s + ' - ' +
      players['0'].name + ': ' + players['0'].score.to_s
  end
end
