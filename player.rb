class Player
  attr_reader :name, :lives
  def initialize(name)
    @name = name
    @lives = 3
  end

  def lost_life
    @lives -= 1
  end

  def is_over
    @lives == 0
  end

  def new_question
    new_question = Question.new
    new_question.ask_question(name)
    print '> '
    @userchoice = $stdin.gets.chomp
    if new_question.check_answer?(@userchoice.to_i)
      puts 'Yes! You are correct.'
    else
      puts 'Seriously? No!'
      lost_life
    end
  end
end
