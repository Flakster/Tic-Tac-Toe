#!/usr/bin/env ruby
require_relative '../lib/interface'
require_relative '../lib/game'

puts "\n\nWelcome to Tic Tac Toe"
game = Game.new
print 'Player 1 name: '
game.players['X'].name = gets.chomp.capitalize
print 'Player 2 name: '
game.players['0'].name = gets.chomp.capitalize
puts "\n\n => Enter 0 to exit <= \n\n"
while game.continue != 'N'
  loop do
    puts "\n\nIt's turn for #{game.current_player}\n\n"
    Interface::board_render(game)
    print "\n\n#{game.players[game.current_player].name}, please choose a position: "
    position = Interface::read_position(game)
    break if position.to_i.zero?

    game.board.store_position(position, game.current_player)
    if game.winner?(position)
      Interface::board_render(game)
      puts "\n\nCongratulations #{game.players[game.current_player].name}, you won!\n\n"
      game.players[game.current_player].increase_score
      break
    end
    if game.board.full?
      Interface::board_render(game)
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
