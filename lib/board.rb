class Board
  attr_accessor :positions
  def initialize
    @positions = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def store_position(pos, mark)
    positions[pos.to_i - 1] = mark
  end

  def full?
    positions.none?(nil) ? true : false
  end

  def taken?(pos)
    positions[pos.to_i - 1].nil? ? false : true
  end

  def pick_string(num)
    selected_string = '  '
    selected_string = '__' if (19..27).cover?(num) || (46..54).cover?(num)
    selected_string = number(num) if num % 27 < 8 && num % 3 == 1
    selected_string = mark(num) if num % 27 > 8 && num % 27 < 18 && num % 3 == 2
    selected_string
  end

  def number(num)
    pos = (num / 3) - (num / 27) * 6
    positions[pos].nil? ? ' ' + (pos + 1).to_s : '  '
  end

  def mark(num)
    pos = (num / 3) - (num / 27) * 6 - 3
    positions[pos].nil? ? '  ' : ' ' + positions[pos]
  end
end
