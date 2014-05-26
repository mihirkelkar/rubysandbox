#!/usr/bin/ruby
puts("Enter a positive integer")
number = gets().chomp.to_i
puts("Enter a string with five letters or more")
string = gets().chomp
puts number.to_s + "\n"
puts (number % 3).to_s + "\n"
puts (number ** 3).to_s + "\n"
puts (Math::log10(number)).to_s + "\n"
puts string + "\n"
puts string[-3..-1]
puts string[2].ord
