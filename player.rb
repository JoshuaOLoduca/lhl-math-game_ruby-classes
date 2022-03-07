class Player
  attr_reader :name, :life, :max_lifes
  
  def initialize(name, lives = 3)
    @name = name
    @max_lifes = lives
    @life = lives
  end

  def lose_life 
    @life -= 1
  end

  def reset
    @life = @max_lifes
  end

end
