class RPN
  attr_accessor :array

  def initialize
    @array = []
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
      validate_input(input = gets.chomp)
      puts "-"
      puts @array
      puts "-"
      #validate_operation(input, array)
    end
  end

  def input_zero?(input)
    input == '0'
  end

  def input_operator?(input)
    input == '-' || input == '+' || input == '*' || input == '/'
  end

  def validate_input(input)
    @array << 0 if input_zero?(input)
    calculate(input) if input_operator?(input)
    @array << input.to_i if input.to_i > 0
    puts 'Try typing a number or an operator' if input.to_i == 0 && !input_operator?(input)
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

  def farewell_message
    puts 'goodbye'
  end
end

RPN.new