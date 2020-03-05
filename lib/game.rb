require_relative '../lib/board'
require_relative '../lib/player'

class Game
  attr_accessor :players, :board, :players, :current_player, :continue
  def initialize
    @board = Board.new
    @players = {}
    @players['X'] = Player.new('Cross', 'X')
    @players['0'] = Player.new('Naught', '0')
    @current_player = 'X'
    @continue = true
  end

  def switch_player
    self.current_player = self.current_player == 'X' ? '0' : 'X'
  end

  def two_d_array
    ar = [['1', '2', '3'],
         ['4', '5', '6'],
         ['7', '8', '9']]
    i = 0
    (0..2).each do |row|
      (0..2).each do |col|
        ar[row][col] = self.board.positions[i]
        i += 1
      end
    end
    ar
  end

  def winner?(pos) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    c = (pos.to_i - 1) % 3
    r = (pos.to_i - 1) / 3
    a = two_d_array
    if a[0][c] == a[1][c] && a[1][c] == a[2][c]
      true
    elsif a[r][0] == a[r][1] && a[r][1] == a[r][2]
      true
    elsif (r - c).zero? && a[0][0] == a[1][1] && a[1][1] == a[2][2]
      true
    elsif r + c == 2 && a[2][0] == a[1][1] && a[1][1] == a[0][2]
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
    self.players['X'].name + ': ' + self.players['X'].score.to_s + ' - ' +
    self.players['0'].name + ': ' + self.players['0'].score.to_s
  end
  
end