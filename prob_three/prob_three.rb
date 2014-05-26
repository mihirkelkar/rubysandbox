#!/usr/bin/ruby
#Not yet complete

def menu()
	puts("Enter 1 to see sentence\n")
	puts("Enter 2 to see whole list\n")
	puts("Enter 3 to change  a sentence\n")
	puts("Enter 4 to switch words\n")
	puts("Enter 5 to count letters\n")
	return gets().chomp.to_i
end
puts "How many sentences do you want to store?"
number = gets().chomp.to_i
if(number <= 0)
	number = 5
end
sentence_list = []
for counter in 1..number
	sentence_list << puts().chomp.downcase
end
for loop_counter in 1..number
	choice = menu()
	if(choice == 1)
		puts("Enter the index of the sentence")
		index = gets().chomp.to_i
		if((index < 0) or (index >= number))
			puts "Error. Invalid Index"
		else
			puts sentence_list[index]
		end
	elsif(choice == 2)
		puts(sentence_list.join("\n"))
	elsif(choice == 3)
		puts("Enter the index of the sentence you want to change")
		puts("Enter the index of the sentence")
		index = gets().chomp.to_i
		if((index < 0) or (index >= number))
			puts "Error. Invalid Index"
		else
			puts("Enter your new sentence")
			sentence_list[index] = gets().chomp.downcase
		end
	elsif(choice == 4)
		puts "Enter word you want to remove"
		word_old = gets().chomp.downcase
		puts "Enter the index of the sentence"
		index_one = gets().chomp.to_i
		if((index < 0) or (index >= number))
			puts "Error. Invalid Index"
			next
		else
			puts sentence_list[index]
		end
	
	
	end
end
