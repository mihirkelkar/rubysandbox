#!/usr/bin/ruby
puts "Enter 2 Integers"
num_one = gets().chomp.to_i
num_two = gets().chomp.to_i
puts("Enter the operation")
oplist = ["add", "divide", "subtract", "multiply"]
op = gets().chomp.downcase
until oplist.include? op
	puts("Invalid operation, enter new operation")
	op = gets().chomp.downcase	
end
puts op
