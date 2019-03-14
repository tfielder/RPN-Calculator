# Reverse Polish Notation (RPN) Calculator

## Basic Info:
* Author: Tim Fielder
* Date: 03/10/19
* Version: 1.0
* Ruby Version: 2.4.1


## To run:
1. Go to https://github.com/tfielder/RPN-Calculator.
2. From your command line (on a linux based-system) and the directory of your choice run `git clone https://github.com/tfielder/RPN-Calculator.git`.
3. Change into the directory by running `cd RPN-Calculator`.
4. (Make sure you have a Ruby version installed or 2.4.1).
5. Run `ruby RPN.rb`.
6. Enjoy the calculator.

## Testing:
Once you've completed the above steps to run the program, try running `cd RPN_test.rb` to use the test-suite. Tests are included in the RPN_test.rb file.

## Assumptions and Decisions:
This project assumes using the Ruby language and version 2.4 or higher.
The program should notify the user if an invalid input is provided.
The program will notify the user if an attempt is made to divide by 0.
The program accepts positive float values or 0.
The output was created to match closely with the provided prompt.
Email the author with any comments, suggestions, or bugs.

## Explanation:
Provided:

Explanation: In Reverse Polish Notation (RPN) the operators follow their operands; for instance, to add three and four one would write `3 4 +` rather then `3 + 4`.  If there are multiple orperations, the operator is given immediately after its second operand; so the expression written `3 - 4 + 5` in conventional infix notation would be written `3 4 - 5 +` in RPN: first subtract 4 from 3, then add 5 to that.

Example: The infix expression `5 + ((1 + 2) * 4) - 3` can be written down like this in RPN: 5 1 2 + 4 * + 3 -

Instructions: Your calculator should handle:

- At least 4 numbers

- The four basic arithemetic operations `+, -, *, /`.

- Use `standard in` and `standard out` to accept and return data. Entering `q` should quit the application.

```
Sample:
1
2
+
= 3
2
*
= 6
4
-
= 2
q
goodbye
```
