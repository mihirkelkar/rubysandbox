#!/usr/bin/ruby

def getbase()
	flag = false
	until flag
		puts "Enter a base between 2 to 9"
		base = gets().chomp
		if base.include? "."
			next
		end
		begin
			Integer(base)
			if (base.to_i >= 2) and (base.to_i <= 9)
				flag = true
				return base.to_i
			end
		rescue
			next		
		end
	end	
end

def convert(number, base)
	base_list = []
	until number == 0
		base_list << (number % base).to_s
		number = number / base
	end
	return base_list	
end

def baser(file_list, base)
	for count in 0..file_list.length - 1
		if file_list[count] != ".."
			file_list[count] = convert(file_list[count].ord, base)
		end
	end
	puts file_list.join("\t")
end


flag = false
until flag
	puts "Enter the name of the file you want to open"
	filename = gets().chomp.downcase
	begin
		file = File.open(filename, "r")
		flag = true
	rescue
		puts "Invalid file name"
	end
end
base = getbase()
#puts "The base is " + String(base)

file_list = []
file.each_line do |line|
	file_list << line.chomp.downcase.split("")
end
#file_list.each do |element|
#	puts element.join("*")
#	puts "----------------"
#end
file_list = file_list.flatten
#puts file_list
#puts "***********************"
for counter in 0..file_list.length - 1
	if file_list[counter] =~ /\A\p{Alnum}\z/
		
	else
	   file_list[counter] = '..'
	end
end
puts file_list
baser(file_list, base)
