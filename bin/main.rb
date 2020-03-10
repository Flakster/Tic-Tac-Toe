#!/usr/bin/env ruby
require_relative '../lib/game'

def digit?(pos)
  /\A\d\z/.match(pos)
end

def read_position(game)
  pos = 0
  loop do
    pos = gets.chomp
    if !digit?(pos)
      print 'Please enter a number between 1 and 9 (or 0 to exit): '
    elsif pos == '0'
      break
    elsif game.board.taken?(pos)
      print 'That position is already taken, please choose an empty one: '
    else
      break
    end
  end
  pos
end

def board_render(game)
  (1..81).each do |i|
    print game.board.pick_string(i)
    if (i % 9).zero?
      puts
    elsif (i % 3).zero?
      print '|'
    end
  end
end

def user_message(str)
  print(str)
end

puts "\n\nWelcome to Tic Tac Toe!" \
     "\n\nUse your turn to place your mark on the board looking for" \
     "\nachieving three in a line (either column, row or diagonal)," \
     "\nbefore your opponent.\n\n"
game = Game.new
print 'Player 1 name: '
game.players['X'].name = gets.chomp.capitalize
print 'Player 2 name: '
game.players['0'].name = gets.chomp.capitalize
puts "\n\n => Enter 0 to exit <= \n\n"
while game.continue != 'N'
  loop do
    puts "\n\nIt's turn for #{game.current_player}\n\n"
    board_render(game)
    print "\n\n#{game.players[game.current_player].name}, please choose a position: "
    position = read_position(game)
    break if position.to_i.zero?

    game.board.store_position(position, game.current_player)
    if game.winner?(position)
      board_render(game)
      puts "\n\nCongratulations #{game.players[game.current_player].name}, you won!\n\n"
      game.players[game.current_player].increase_score
      break
    end
    if game.board.full?
      board_render(game)
      puts "\n\n=> We have a draw between #{game.players['X'].name} and #{game.players['0'].name}!\n\n"
      break
    end
    game.switch_player
  end
  puts "Current scores: #{game.display_scores}\n\n"
  print 'Play again? (Y/N): '
  game.continue = gets.chomp.upcase
  game.reset unless game.continue == 'N'
end
