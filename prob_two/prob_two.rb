#!/usr/bin/ruby
puts "Enter 2 Integers"
num_one = gets().chomp.to_i
num_two = gets().chomp.to_i
puts("Enter the operation")
oplist = ["add", "divide", "subtract", "multiply"]
oper = gets().chomp
op = oper.downcase
until oplist.include? op
	puts("Invalid operation, enter new operation")
	oper = gets().chomp
	op = oper.downcase
end
if(op == "add")
	puts "The first operand is " + num_one.to_s
	puts "The second operand is " + num_two.to_s
	puts "The operation is " + oper
	result = num_one + num_two
	puts "The result is " + result.to_s

elsif (op == "subtract")
	puts "The first operand is " + num_one.to_s
	puts "The second operand is " + num_two.to_s
	puts "The operation is " + oper
	result = num_one - num_two
	puts "The result is " + result.to_s
elsif (op == "multiply")
	puts "The first operand is " + num_one.to_s
	puts "The second operand is " + num_two.to_s
	puts "The operation is " + oper
	result = num_one * num_two
	puts "The result is " + result.to_s
elsif (op == "divide")
	puts "The first operand is " + num_one.to_s
	puts "The second operand is " + num_two.to_s
	puts "The operation is " + oper	
	if(num_two == 0)
		puts "Division by zero is not allowed"
	else
		result = num_one / num_two
		puts "The result is" + result.to_s
	end

end
