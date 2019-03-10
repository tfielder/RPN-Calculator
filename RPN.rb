class RPN
  def initialize
    main_program
  end

  def main_program
    welcome_message
    execute_calculator
    farewell_message
  end

  def welcome_message
    puts 'Welcome to the Reverse Polish Notation Calculator'
  end

  def execute_calculator
    input = 0
    while input != 'q'
      input = gets.chomp
    end
  end

  def farewell_message
    puts 'goodbye'
  end
end

RPN.new