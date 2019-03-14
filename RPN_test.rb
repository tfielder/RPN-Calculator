gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'RPN_class'

class RPNTest < Minitest::Test
  def setup
    @rpn = RPN.new
  end

  def test_creates_new_class
    assert @rpn
  end

  def test_it_has_welcome_message
    skip
    welcome = @rpn.welcome_message
    assert_equal welcome, "Welcome to the Reverse Polish Notation Calculator"
  end

  def test_it_has_empty_stack
    assert_equal [], @rpn.stack
  end

  def test_it_validates_input_is_zero
    input1 = @rpn.input_zero?("0")
    input2 = @rpn.input_zero?(0)
    input3 = @rpn.input_zero?("+")
    input4 = @rpn.input_zero?("zero")

    assert_equal true, input1
    assert_equal false, input2
    assert_equal false, input3
    assert_equal false, input4
  end

  def test_it_validates_input_is_operator
    input1 = @rpn.input_operator?("+")
    input2 = @rpn.input_operator?("-")
    input3 = @rpn.input_operator?("/")
    input4 = @rpn.input_operator?("*")
    input5 = @rpn.input_operator?("%")
    input6 = @rpn.input_operator?("add")
    input7 = @rpn.input_operator?("1")

    assert_equal true, input1
    assert_equal true, input2
    assert_equal true, input3
    assert_equal true, input4
    assert_equal false, input5
    assert_equal false, input6
    assert_equal false, input7
  end

  def test_it_validates_input_is_number
    input1 = @rpn.input_number?("1")
    input2 = @rpn.input_number?("-1")
    input3 = @rpn.input_number?("5.9")
    input4 = @rpn.input_number?("-5.9")
    input5 = @rpn.input_number?(123)

    input6 = @rpn.input_number?("one")
    input7 = @rpn.input_number?("0")
    input8 = @rpn.input_number?("+")


    assert_equal true, input1
    assert_equal true, input2
    assert_equal true, input3
    assert_equal true, input4
    assert_equal true, input5
    assert_equal false, input6
    assert_equal false, input7
    assert_equal false, input8
  end

  def test_it_validates_input
    input1 = @rpn.valid_input?("0")
    input2 = @rpn.valid_input?("+")
    input3 = @rpn.valid_input?("-")
    input4 = @rpn.valid_input?("/")
    input5 = @rpn.valid_input?("*")
    input6 = @rpn.valid_input?("1")
    input7 = @rpn.valid_input?("1.1")
    input8 = @rpn.valid_input?("-1")
    input9 = @rpn.valid_input?("-1")
    input10 = @rpn.valid_input?("-1")
    input11 = @rpn.valid_input?("-1")
    input12 = @rpn.valid_input?("-1")

    input13 = @rpn.valid_input?("yes")
    input14 = @rpn.valid_input?("%@*i")

    assert_equal true, input1
    assert_equal true, input2
    assert_equal true, input3
    assert_equal true, input4
    assert_equal true, input5
    assert_equal true, input6
    assert_equal true, input7
    assert_equal true, input8
    assert_equal true, input9
    assert_equal true, input10
    assert_equal true, input11
    assert_equal true, input12

    assert_equal false, input13
    assert_equal false, input14
  end

  def test_it_adds_to_the_stack
    assert_equal 0, @rpn.stack.count
    @rpn.add_to_stack("0")
    assert_equal 1, @rpn.stack.count
    @rpn.add_to_stack("-10.1")
    assert_equal 2, @rpn.stack.count
    @rpn.add_to_stack("holy_cow")
    assert_equal 2, @rpn.stack.count
  end

  def test_it_has_enough_operands
    assert_equal false, @rpn.enough_operands?
    @rpn.add_to_stack("0")
    assert_equal false, @rpn.enough_operands?
    @rpn.add_to_stack("1")
    assert_equal true, @rpn.enough_operands?
  end

  def test_it_asks_division_by_zero
    @rpn.add_to_stack("0")
    @rpn.add_to_stack("1")
    case1 = @rpn.division_by_zero?("/")
    case2 = @rpn.division_by_zero?("+")
    assert_equal false, case1
    assert_equal false, case2

    @rpn.add_to_stack("0")
    case3 = @rpn.division_by_zero?("/")
    case4 = @rpn.division_by_zero?("+")
    assert_equal true, case3
    assert_equal false, case4
  end

  def test_valid_calculation
    @rpn.add_to_stack("0")
    case1 = @rpn.valid_calculation?("+")
    case2 = @rpn.valid_calculation?("/")

    assert_equal false, case1
    assert_equal false, case2

    @rpn.add_to_stack("1")
    case3 = @rpn.valid_calculation?("/")
    assert_equal true, case3

    @rpn.add_to_stack("0")
    case4 = @rpn.valid_calculation?("/")
    assert_equal false, case4
  end

  def test_determine_calculation
    @rpn.add_to_stack("2")
    @rpn.add_to_stack("2")
    @rpn.determine_calculation("+")
    assert_equal 4, @rpn.stack[-2]
    assert_equal 2, @rpn.stack[-1]

    @rpn.add_to_stack("2")
    @rpn.add_to_stack("2")
    @rpn.determine_calculation("-")
    assert_equal 0, @rpn.stack[-2]
    assert_equal 2, @rpn.stack[-1]

    @rpn.add_to_stack("3")
    @rpn.add_to_stack("3")
    @rpn.determine_calculation("*")
    assert_equal 9, @rpn.stack[-2]
    assert_equal 3, @rpn.stack[-1]

    @rpn.add_to_stack("9")
    @rpn.add_to_stack("3")
    @rpn.determine_calculation("/")
    assert_equal 3, @rpn.stack[-2]
    assert_equal 3, @rpn.stack[-1]
  end

  def test_it_updates_stack
    @rpn.add_to_stack("9")
    @rpn.add_to_stack("3")
    assert_equal 9, @rpn.stack[-2]
    assert_equal 3, @rpn.stack[-1]
    @rpn.update_stack
    assert_equal 1, @rpn.stack.count
    assert_equal 9, @rpn.stack[-1]
  end
end