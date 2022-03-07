require './question.rb'
class GameManager
  def initialize(player_list)
    @players = player_list
    @player_index = (0..(player_list.length - 1)).to_a
  end

  def start
    while @player_index.length > 1
      start_turn
    end
    return prompt_for_replay
  end

  protected

  def start_turn
    puts '---- NEW TURN ----'
    current_player = @players[@player_index[0]]
    remaining_lifes = current_player.life
    answer_is_correct = ask_question current_player.name

    if answer_is_correct == false
      remaining_lifes = current_player.lose_life
    end
    # END OF TURN
    if remaining_lifes <= 0 
      @player_index.shift
    else
      @player_index.rotate!
    end

    puts format_player_lives
    
    print_winner if @player_index.length == 1
  end

  # Returns bool bases on correct/incorrect answer
  def ask_question player_name
    question = Question.new
    
    puts "#{player_name}: #{question.prompt}"
    answer = gets.chomp.to_i
    
    if answer == question.solution
      puts "Correct!"
      return true 
    else
      puts "You're a failure"
      return false
    end
  end

  def format_player_lives
    result = []
    @players.each do |player|
      result.push("#{player.name}: #{player.life}/#{player.max_lifes}")
    end

    return result.join(' vs ')
  end

  def print_winner
    puts "Congratualtions #{@players[@player_index[0]].name}! You Won!"
  end

  def prompt_for_replay
    print "Play Again? y/n: "
    answer = gets.chomp.downcase
    return true if answer == 'y'
    return false
  end
end