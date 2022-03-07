class Player
  attr_reader :name, :life
  def initialize(name, lives = 3)
    @name = name
    @life = lives
  end

  def lose_life 
    @life -= 1
  end

end
