#!/usr/bin/ruby
def getinteger()
	puts "Enter an unsigned integer"
	choice = gets().chomp
	if choice.downcase == 'stop'
		Kernel.exit(false)
	end
	if choice.include? "."
		choice = getinteger()
	else
		begin
			choice = Integer(choice)
			if choice < 0
				choice = getinteger()	
			end
		rescue
			choice = getinteger()
		end
	end
	return choice
end

def menu()
	puts "Enter B for binary, O for Octal, H for hexadecimal\n"
	menu_choice = gets.chomp().downcase
	if ['b','o','h'].include? menu_choice
		if menu_choice == 'b'
			return 2
		elsif menu_choice == 'o'
			return 8
		elsif menu_choice == 'h'
			return 16
		end
	else
		menu_choice = menu()
	end
	return menu_choice
end

def change_letters(base_list, base)
	if base == 2 or base == 8
		return base_list
	elsif base == 16
		for counter in 0..base_list.length - 1
			if base_list[counter].to_i >= 10
				base_list[counter] = (65 + (base_list[counter].to_i - 10)).chr
			end
		end
	end
	return base_list
end	

def convert_base(number, base)
	#puts number
	#puts base
	base_list = []
	until number == 0
		base_list << (number % base).to_s
		number = number / base
	end
	base_list = change_letters(base_list, base)
	#puts base_list
	puts(base_list.join('').reverse)

end
until false
	number = getinteger()
	base =  menu()
	convert_base(number, base)
	puts  "------------------------"
end
