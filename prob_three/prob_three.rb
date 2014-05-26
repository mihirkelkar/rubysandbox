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
puts("Enter the sentences now\n")
for counter in 1..number
	sentence_list << gets().chomp.downcase
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
		index = gets().chomp.to_i
		if((index < 0) or (index >= number))
			puts "Error. Invalid Index"
		else
			puts("Enter your new sentence")
			sentence_list[index] = gets().chomp.downcase
		end
	elsif(choice == 4)
		puts "Enter word you want to swap"
		word_one = gets().chomp.downcase
		puts "Enter the index of the sentence"
		index_one = gets().chomp.to_i
		puts "Enter next word you want to swap"
		word_two = gets().chomp.downcase
		puts "Enter the index of the sentence"
		index_two = gets().chomp.to_i
		if((index_one < 0) or (index_one >= number))
			puts "Error. Invalid Index for first sentence"
			next
		else
			if sentence_list[index_one].include? word_one
				puts ""
			else
				puts "Word not in sentence"
				next
			end
		end
		
		if((index_two < 0) or (index_two >= number))
			puts "Error. In valid index for sentence two"
			next
		else
			if sentence_list[index_two].include? word_two
				puts ""
			else
				puts "Word not in sentence"
				next
			end
		end
		sentence_list[index_one] = sentence_list[index_one].sub(word_one, word_two)
		sentence_list[index_two] = sentence_list[index_two].sub(word_two, word_one)
		puts "Words swapped"
	
	elsif(choice == 5)
		puts "Enter the letter you want to count"
		letter = gets().chomp.downcase[0]
		string_count = sentence_list.join("").count(letter)
		puts string_count
	end
end
