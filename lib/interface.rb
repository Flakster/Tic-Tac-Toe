#!/usr/bin/env ruby
require './lib/game'

module Interface

  def self.digit?(pos)
    /\A\d\z/.match(pos)
  end

  def self.read_position(game)
    pos = 0
    loop do
      pos = gets.chomp
      if !Interface::digit?(pos)
        print 'Please enter a number between 1 and 9 (or 0 to exit): '
      elsif game.board.taken?(pos)
        print 'That position is already taken, please choose an empty one: '
      else
        break
      end
    end
    pos
  end
  
  def self.board_render(game)
    (1..81).each do |i|
      print game.board.pick_char(i)
      if (i % 9).zero?
        puts
      elsif (i % 3).zero?
        print '|'
      end
    end
  end

end