class Board
  attr_accessor :positions
  def initialize
    @positions = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def store_position(pos, mark)
    self.positions[pos.to_i - 1] = mark
  end

  def full?
    self.positions.none?(nil) ? true : false
  end

  def taken?(pos)
    self.positions[pos.to_i - 1].nil? ? false : true
  end
  
  def pick_char(num) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    case num
    when 19..27, 46..54
      '__'
    when 1
      self.positions[0].nil? ? ' 1' : '  '
    when 4
      self.positions[1].nil? ? ' 2' : '  '
    when 7
      self.positions[2].nil? ? ' 3' : '  '
    when 11
      self.positions[0].nil? ? '  ' : ' ' + self.positions[0]
    when 14
      self.positions[1].nil? ? '  ' : ' ' + self.positions[1]
    when 17
      self.positions[2].nil? ? '  ' : ' ' + self.positions[2]
    when 28
      self.positions[3].nil? ? ' 4' : '  '
    when 31
      self.positions[4].nil? ? ' 5' : '  '
    when 34
      self.positions[5].nil? ? ' 6' : '  '
    when 38
      self.positions[3].nil? ? '  ' : ' ' + self.positions[3]
    when 41
      self.positions[4].nil? ? '  ' : ' ' + self.positions[4]
    when 44
      self.positions[5].nil? ? '  ' : ' ' + self.positions[5]
    when 55
      self.positions[6].nil? ? ' 7' : '  '
    when 58
      self.positions[7].nil? ? ' 8' : '  '
    when 61
      self.positions[8].nil? ? ' 9' : '  '
    when 65
      self.positions[6].nil? ? '  ' : ' ' + self.positions[6]
    when 68
      self.positions[7].nil? ? '  ' : ' ' + self.positions[7]
    when 71
      self.positions[8].nil? ? '  ' : ' ' + self.positions[8]
    else
      '  '
    end
  end
end