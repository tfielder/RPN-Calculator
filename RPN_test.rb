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

    input9 = @rpn.valid_input?("yes")
    input10 = @rpn.valid_input?("%@*i")

    assert_equal true, input1
    assert_equal true, input2
    assert_equal true, input3
    assert_equal true, input4
    assert_equal true, input5
    assert_equal true, input6
    assert_equal true, input7
    assert_equal true, input8

    assert_equal false, input9
    assert_equal false, input10
  end

  def test_it_
    skip
    assert_equal exp, act
  end

  def test_it_
    skip
    assert_equal exp, act
  end
end