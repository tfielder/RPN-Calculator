class RPN
  attr_accessor :array

  def initialize
    @array = []
    main_program
  end

  def main_program
    welcome_message
    run_loop
    farewell_message
  end

  def welcome_message
    puts 'Welcome to the Reverse Polish Notation Calculator'
  end

  def run_loop
    input = 0
    while input != 'q'
      input = gets.chomp
      execute_calculator(input) if valid_input?(input)
      puts 'Try typing a number or an operator' if !valid_input?(input)
    end
  end

  def valid_input?(input)
    input_zero?(input) || input_operator?(input) || input_number?(input) || 'q'
  end

  def input_zero?(input)
    input == '0'
  end

  def input_operator?(input)
    input == '-' || input == '+' || input == '*' || input == '/'
  end

  def input_number?(input)
    input.to_f > 0
  end

  def execute_calculator(input)
    @array << 0 if input_zero?(input)
    attempt_calculation(input) if input_operator?(input)
    @array << input.to_f if input_number?(input)
  end

  def enough_operands?
    @array.count >= 2
  end

  def division_by_zero?(operator)
    operator == '/' && @array[-1] == 0
  end

  def valid_calculation?(operator)
    enough_operands? && !division_by_zero?(operator)
  end

  def attempt_calculation(operator)
    puts 'Check your notation, there are not enough elements to calculate' if !enough_operands?
    puts 'Cannot divide by zero' if division_by_zero?(operator)
    return if !valid_calculation?(operator)
    calculate(operator)
  end

  def calculate(operator)
    @array[-2] = @array[-2] + @array[-1] if operator == '+'
    @array[-2] = @array[-2] - @array[-1] if operator == '-'
    @array[-2] = @array[-2] * @array[-1] if operator == '*'
    @array[-2] = @array[-2] / @array[-1] if operator == '/'
    @array.pop
    @array[-1] = @array[-1].to_i if @array[-1] % 1 == 0
    puts "=" + @array.last.to_s
  end

  def farewell_message
    puts 'goodbye'
  end
end

RPN.new