#!/usr/bin/ruby

"""*****************************************************************
			NOT YET COMPLETE
********************************************************************"""
def getinteger()
	puts "Enter an unsigned integer"
	choice = gets().chomp
	begin
		choice = Integer(choice)
		if choice < 0
			choice = getinteger()	
		end
	rescue
		puts "Not an integer, enter again"
		choice = gets().chomp
		choice = getinteger()
	end
	return choice
end


puts getinteger()
