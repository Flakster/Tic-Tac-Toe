#!/usr/bin/env ruby

$board = [] # rubocop:disable Style/GlobalVars

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
    if (i % 9).zero?
      puts
    elsif (i % 3).zero?
      print '|'
    end
  end
end

def pick_char(num)
  case num
  when 19..27, 46..54
    '__'
  when 1
    $board[0].nil? ? ' 1' : '  '
  when 4
    $board[1].nil? ? ' 2' : '  '
  when 7
    $board[2].nil? ? ' 3' : '  '
  when 11
    $board[0].nil? ? '  ' : ' ' + $board[0]
  when 14
    $board[1].nil? ? '  ' : ' ' + $board[1]
  when 17
    $board[2].nil? ? '  ' : ' ' + $board[2]
  when 28
    $board[3].nil? ? ' 4' : '  '
  when 31
    $board[4].nil? ? ' 5' : '  '
  when 34
    $board[5].nil? ? ' 6' : '  '
  when 38
    $board[3].nil? ? '  ' : ' ' + $board[3]
  when 41
    $board[4].nil? ? '  ' : ' ' + $board[4]
  when 44
    $board[5].nil? ? '  ' : ' ' + $board[5]
  when 55
    $board[6].nil? ? ' 7' : '  '
  when 58
    $board[7].nil? ? ' 8' : '  '
  when 61
    $board[8].nil? ? ' 9' : '  '
  when 65
    $board[6].nil? ? '  ' : ' ' + $board[6]
  when 68
    $board[7].nil? ? '  ' : ' ' + $board[7]
  when 71
    $board[8].nil? ? '  ' : ' ' + $board[8]
  else
    '  '
  end
end

def store_position(pos, mark)
  $board[pos.to_i-1] = mark
end

def board_full?
  $board.none?(nil) ? true : false
end

def winner?(pos)
  c = (pos.to_i - 1)%3
  r = (pos.to_i - 1)/3
  a = [['','',''],
       ['','',''],
       ['','','']]
  i = 0
  (0..2).each do |row|
    (0..2).each do |col|
      a[row][col] = $board[i]
      i+=1
    end
  end
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

def taken?(pos)
  $board[pos.to_i-1].nil? ? false : true
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
  $board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  # this should ocurr in the board initialize method
  loop do
    puts "\n\nIt's turn for #{$current_player}\n\n" # rubocop:disable Style/GlobalVars
    board_render
    print "\n\n#{$players[$current_player]}, please choose a position: " # rubocop:disable Style/GlobalVars
    position = read_position
    break if position.to_i.zero?

    store_position(position, $current_player)
    if board_full?
      board_render
      puts "\n\n=> We have a draw between #{$players['X']} and #{$players['0']}!\n\n"
      break
    end
    if winner?(position)
      board_render
      puts "\n\nCongratulations #{$players[$current_player]}, you won!\n\n"
      break
    end
    switch_player
  end
  print 'Play again? (Y/N): '
  $continue = gets.chomp # rubocop:disable Style/GlobalVars
end
