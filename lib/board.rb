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

  def pick_char(num) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    case num
    when 19..27, 46..54
      '__'
    when 1
      positions[0].nil? ? ' 1' : '  '
    when 4
      positions[1].nil? ? ' 2' : '  '
    when 7
      positions[2].nil? ? ' 3' : '  '
    when 11
      positions[0].nil? ? '  ' : ' ' + positions[0]
    when 14
      positions[1].nil? ? '  ' : ' ' + positions[1]
    when 17
      positions[2].nil? ? '  ' : ' ' + positions[2]
    when 28
      positions[3].nil? ? ' 4' : '  '
    when 31
      positions[4].nil? ? ' 5' : '  '
    when 34
      positions[5].nil? ? ' 6' : '  '
    when 38
      positions[3].nil? ? '  ' : ' ' + positions[3]
    when 41
      positions[4].nil? ? '  ' : ' ' + positions[4]
    when 44
      positions[5].nil? ? '  ' : ' ' + positions[5]
    when 55
      positions[6].nil? ? ' 7' : '  '
    when 58
      positions[7].nil? ? ' 8' : '  '
    when 61
      positions[8].nil? ? ' 9' : '  '
    when 65
      positions[6].nil? ? '  ' : ' ' + positions[6]
    when 68
      positions[7].nil? ? '  ' : ' ' + positions[7]
    when 71
      positions[8].nil? ? '  ' : ' ' + positions[8]
    else
      '  '
    end
  end
end
