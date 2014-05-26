#!/usr/bin/ruby

"""*****************************************************************
			NOT YET COMPLETE
********************************************************************"""
def getinteger()
	puts "Enter an unsigned integer"
	choice = gets().chomp
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

def convert_base(number, base)
	#puts number
	#puts base
	base_list = []
	until number == 0
		base_list << (number % base).to_s
		number = number / base
	end
	puts(base_list.join('').reverse)

end

number = getinteger()
base =  menu()
convert_base(number, base)
