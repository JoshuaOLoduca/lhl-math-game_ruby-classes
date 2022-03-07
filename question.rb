class Question
  attr_reader :prompt, :solution
  def initialize()
    question = make_question()
    @prompt = question[0]
    @solution = question[1]
  end

  protected

  def make_question low = 1, high = 20
    num1 = rand(low..high)
    num2 = rand(low..high)

    question = generate_question num1, num2
    solution = generate_solution num1, num2

    return [question, solution]
  end

  def generate_solution num1, num2, operator = 'plus'

    case operator
    when 'plus'
      return num1 + num2
    else
      return 0
    end

  end

  def generate_question num1, num2, operator = 'plus'
    "What is #{num1} #{operator} #{num2}?"
  end

end