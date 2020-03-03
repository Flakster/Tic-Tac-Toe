  #!/usr/bin/env ruby

  $current_player = 'X' # should be an instance variable from the game class
  
  $players= Hash.new # should be an instance variable from the game class

  def switch_player
    $current_player = $current_player == 'X' ? '0' : 'X'
  end

  def digit?(pos)
    /\A\d\z/.match(pos)
  end

  def taken?(p)
    false
    #should ask to the board object if the position is taken 
  end

  def get_position
    pos= 0
    loop do
      pos = gets.chomp
      if !digit?(pos)
        print "Please enter a number between 1 and 9 (or 0 to exit): "
      elsif taken?(pos)
        print "That position is already taken, please choose an empty one: "
      else
        break
      end
    end
    pos
  end
  
  puts "\n\nWelcome to Tic Tac Toe"
  print "Player 1 name: "
  player_name = gets.chomp
  $players['X'] = player_name
  print "Player 2 name: "
  player_name = gets.chomp
  $players['0'] = player_name
  
  puts " => Enter 0 to exit <="
  $continue= 'Y'
  while $continue.upcase != 'N'
    loop do
      puts "\n\nIt's turn for #{$current_player}"
      print "#{$players[$current_player]}, please choose a position: "
      position = get_position
      break if position.to_i.zero?
      puts "\n\n => Position #{position} of the board should show: #{$current_player}"
      switch_player
    end
    print "Play again? (Y/N): "
    $continue = gets.chomp
  end

