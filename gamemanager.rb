class GameManager
  def initialize(player_list)
    # [PlayerClass, PlayerClass]
    @players = player_list
    # [0,1,2]
    # [1,2,0]
    # [2,0,1]
    @player_index = (0..(player_list.length - 1)).to_a
  end

  def start
    start_turn while @player_index.length > 1
    print_winner
    prompt_for_replay
  end

  protected

  def start_turn
    puts '---- NEW TURN ----'
    current_player = @players[@player_index[0]]
    remaining_lifes = current_player.life
    answer_is_correct = ask_question current_player.name

    remaining_lifes = current_player.lose_life unless answer_is_correct

    # END OF TURN
    if remaining_lifes <= 0
      @player_index.shift
    else
      @player_index.rotate!
    end

    puts format_player_lives
  end

  # Returns bool bases on correct/incorrect answer
  def ask_question(player_name)
    question = Question.new

    puts "#{player_name}: #{question.prompt}"
    answer = gets.chomp.to_i

    if answer == question.solution
      puts 'Correct!'
      true
    else
      puts "You're a failure"
      false
    end
  end

  def format_player_lives
    result = []
    @players.each do |player|
      result.push("#{player.name}: #{player.life}/#{player.max_lifes}")
    end

    result.join(' vs ')
  end

  def print_winner
    puts "Congratualtions #{@players[@player_index[0]].name}! You Won!"
  end

  def prompt_for_replay
    print 'Play Again? y/n: '
    answer = gets.chomp.downcase
    return true if answer == 'y'

    false
  end
end
