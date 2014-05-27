#!/usr/bin/ruby
def menu()
	puts "Enter 2 for base 2\n"
	puts "Enter 8 for base 8\n"
	puts "Enter 16 for base 16\n"
	puts "Enter 0 to stop\n"
	menu_choice = gets().chomp
	if menu_choice.include? "."
		puts "Invalid choice"
		return menu()
	end
	begin
		Integer(menu_choice)
		if ['2','8','16','0'].include? menu_choice
			return menu_choice
		else
			puts "Invalid choice"
			return menu()
		end
	rescue
		puts "Invalid choice"
		return menu()
	end
end

def select_function(menu_choice)
	if menu_choice == '2'
		bool, base2 = isBase2()
		base2to10(base2)
	elsif menu_choice == '8'
		bool, base8 = isBase8()
		base8to10(base8)
	elsif menu_choice == '16'
		bool, base16 = isBase16()
		base16to10(base16)
	elsif menu_choice == '0'
		Kernel.exit(false)
	end
end


def isBase2()
	flag_main = false
	until flag_main
		
		puts "Enter a base 2 number"
		base2 = gets().chomp
		flag = 0
		#puts base2.split("")
		base2.split("").each do |element|
			if '10'.include? element
			else
				#puts "Wrong detected"
				flag = 1
			end
		end
	
		if flag == 0
			flag_main = true
		end

	end
	return true, base2
end

def isBase8()
	flag_main = false
	until flag_main
		puts "Enter a base 8 number"
		base8 = gets().chomp
		flag = 0
		base8.split("").each do |element|
			if '01234567'.include? element
			else
				flag = 1
			end
		end	
		if flag == 0
			flag_main = true
		end
		
	end
	return true, base8
end

def isBase16()
	flag_main = false
	until flag_main
		puts "Enter a base 16 number"
		base16 = gets().chomp.downcase
		flag = 0
		base16.split("").each do |element|
			if '0123456789abcdef'.include? element
			else
				flag = 1
			end
		end	
		if flag == 0
			flag_main = true
		end
		
	end
	return true, base16
end

def base2to10(base2)
	br = base2.reverse
	sum = 0
	for counter in 0..base2.length
		sum += br[counter].to_i * (2 ** counter) 			
	end
	puts sum
end

def base8to10(base8)
	br = base8.reverse
	sum = 0
	for counter in 0..base8.length
		sum += br[counter].to_i * (8 ** counter) 			
	end
	puts sum
end

def base16to10(base16)
	br = base16.reverse
	sum = 0
	br = br.split("")
	for counter in 0..base16.length - 1
		if 'abcdef'.include? br[counter]
			#puts br[counter]
			br[counter] = (10 + (br[counter].capitalize.ord - 65)).to_s
		end
		sum += br[counter].to_i * (16 ** counter) 			
	end
	puts sum
end

until false
	select_function(menu())
end

