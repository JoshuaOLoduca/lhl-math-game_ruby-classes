class Player
  attr_reader :name
  attr_accessor :life
  def initialize(name, lives = 3)
    @name = name
    @life = lives
  end
end