#!/usr/bin/env ruby

$board = [nil, '0', 'X', nil, 'X', nil, 'X', '0', nil]

$current_player = 'X' # rubocop:disable Style/GlobalVars
# should be an instance variable from the game class

$players = {} # rubocop:disable Style/GlobalVars
# should be an instance variable from the game class

def switch_player
  $current_player = $current_player == 'X' ? '0' : 'X' # rubocop:disable Style/GlobalVars
end

def digit?(pos)
  /\A\d\z/.match(pos)
end

def taken?(pos) # rubocop:disable Lint/UnusedMethodArgument
  false
  # should ask to the board object if the position is taken
end

def read_position
  pos = 0
  loop do
    pos = gets.chomp
    if !digit?(pos)
      print 'Please enter a number between 1 and 9 (or 0 to exit): '
    elsif taken?(pos)
      print 'That position is already taken, please choose an empty one: '
    else
      break
    end
  end
  pos
end

def board_render
  (1..81).each do |i|
    print pick_char(i)
    if (i%9).zero?
      puts
    elsif (i%3).zero?
      print '|'
    end
  end
end

def pick_char(num)
  char=''
  if num >= 19 && num <= 27 || num >= 46 && num <= 54
    char = '__'
  elsif num == 1 && $board[0].nil?
    char = '1 '
  elsif num == 4 && $board[1].nil?
    char = '2 '
  elsif num == 7 && $board[2].nil?
    char = '3 '
  elsif num == 11 && !$board[0].nil?
    char = ' ' + $board[0]
  elsif num == 14 && !$board[1].nil?
    char = ' ' + $board[1]
  elsif num == 17 && !$board[2].nil?
    char = ' ' + $board[2]
  elsif num == 28 && $board[3].nil?
    char = '4 '
  elsif num == 31 && $board[4].nil?
    char = '5 '
  elsif num == 34 && $board[5].nil?
    char = '6 '
  elsif num == 38 && !$board[3].nil?
    char = ' ' + $board[3]
  elsif num == 41 && !$board[4].nil?
    char = ' ' + $board[4]
  elsif num == 44 && !$board[5].nil?
    char = ' ' + $board[5]
  elsif num == 55 && $board[6].nil?
    char = '7 '
  elsif num == 58 && $board[7].nil?
    char = '8 '
  elsif num == 61 && $board[8].nil?
    char = '9 '
  elsif num == 65 && !$board[6].nil?
    char = ' ' + $board[6]
  elsif num == 68 && !$board[7].nil?
    char = ' ' + $board[7]
  elsif num == 71 && !$board[8].nil?
    char = ' ' + $board[8]
  else
    char = '  '
  end
  char
end


puts "\n\nWelcome to Tic Tac Toe"
print 'Player 1 name: '
player_name = gets.chomp.capitalize
$players['X'] = player_name # rubocop:disable Style/GlobalVars
print 'Player 2 name: '
player_name = gets.chomp.capitalize
$players['0'] = player_name # rubocop:disable Style/GlobalVars
puts ' => Enter 0 to exit <='
$continue = 'Y' # rubocop:disable Style/GlobalVars
while $continue.upcase != 'N' # rubocop:disable Style/GlobalVars
  loop do
    puts "\n\nIt's turn for #{$current_player}\n\n" # rubocop:disable Style/GlobalVars
    board_render
    print "\n\n#{$players[$current_player]}, please choose a position: " # rubocop:disable Style/GlobalVars
    position = read_position
    break if position.to_i.zero?

    switch_player
  end
  print 'Play again? (Y/N): '
  $continue = gets.chomp # rubocop:disable Style/GlobalVars
end
