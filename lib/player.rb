class Player
  attr_accessor :name
  attr_reader :mark, :score

  def initialize(name, mark)
    @name = name
    @mark = mark
    @score = 0
  end

  def increase_score
    @score += 1
  end
end
