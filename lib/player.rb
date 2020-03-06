class Player
  attr_accessor :name, :score
  attr_reader :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
    @score = 0
  end

  def increase_score
    self.score += 1
  end
end
