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
      #puts 'Try typing a number or an operator' if (!input_number?(input) || !input_operator?(input))
      print_array
    end
  end

  def input_zero?(input)
    input == '0'
  end

  def input_operator?(input)
    input == '-' || input == '+' || input == '*' || input == '/'
  end

  def input_number?(input)
    input.to_i > 0
  end

  def valid_input?(input)
    input_zero?(input) || input_operator?(input) || input_number?(input)
  end

  def execute_calculator(input)
    @array << 0 if input_zero?(input)
    calculate(input) if input_operator?(input)
    @array << input.to_i if input_number?(input)
  end

  def calculate(operator)
    if @array.count >= 2
       @array[-2] = @array[-2] + @array[-1] if operator == '+'
       @array[-2] = @array[-2] - @array[-1] if operator == '-'
       @array[-2] = @array[-2] * @array[-1] if operator == '*'
       if operator == '/'
         if @array[-1] == 0
           puts 'Cannot divide by zero'
           return
         end
         @array[-2] = @array[-2] / @array[-1]
       end
       @array.pop
       puts "=" + @array.last.to_s
    else
      puts 'Check your notation, there are not enough elements to calculate'
    end
  end

  def print_array
    puts "-"
    puts @array
    puts "-"
  end

  def farewell_message
    puts 'goodbye'
  end
end

RPN.new