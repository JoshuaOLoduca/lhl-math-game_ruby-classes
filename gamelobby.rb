require './player.rb'
require './gamemanager.rb'
class GameLobby
  def initialize()
    @players = []
  end

  # Starts game
  def start()
    get_players = true
    replay = true
    while get_players
      @players.push(get_player)
      get_players = prompt_for_another_player
    end

    while replay
      game = GameManager.new(@players)
      @players.each do |player|
        player.reset
      end
      replay = game.start()
    end
  end

  # Return true or false
  def prompt_for_another_player
    return true if @players.length == 1

    puts "Do you wish to add another player? y/n"
    input =  gets.chomp.downcase

    return false unless input == "y"
    true
  end
  
  # Get player name and init new Player from Class
  def get_player
    print 'What is their name? '
    player_name = gets.chomp

    Player.new(player_name)
  end
  
end