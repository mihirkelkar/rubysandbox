def fill(grid, row_number, col_number, flag_display)
	if grid[row_number][col_number] != 'I' and grid[row_number][col_number] != "@"
		grid[row_number][col_number] = '@'
		if flag_display == 1
			for counter in 0..grid.length - 1
				puts grid[counter].join(" ")
			end
		puts "\n" * 3
		end		 
		if row_number - 1 > 0
			grid = fill(grid, row_number - 1, col_number, flag_display)
		end
		if col_number - 1 > 0
			grid = fill(grid, row_number, col_number - 1, flag_display)
		end
		if row_number + 1 < grid.length
			grid = fill(grid, row_number + 1, col_number, flag_display)
		end
		if col_number + 1 < grid[0].length
			grid = fill(grid, row_number, col_number + 1, flag_display)
		end
	end
	return grid
end

flag = false
until flag
	puts "Enter the name of the data file\n"
	filename = gets().chomp
	begin	
		file = File.open(filename, 'r')
		flag = true
	rescue
		flag = false
	end
end

#__________________________________________________________________________________
file_list = []
#Make file-list
file.each_line do |line|
	file_list << line.chomp.split("")
end
#__________________________________________________________________________________
#-------------------------CHECK IF THIS IS RECTANGULAR-----------------------------
flag_one = true
total = file_list.length * file_list[0].length
total_flatten = file_list.flatten.length
if total != total_flatten
	puts "Your input was not rectangular\n"
	Kernel.exit(false)
end

total_flatten = file_list.flatten
for counter in 0..total_flatten.length - 1
	if total_flatten[counter] != "-" and total_flatten[counter] != 'I'
		puts "Your input has charecters other than - and I\n"
		Kernel.exit(false)
	end
end

for i in 0..file_list.length - 1
	puts file_list[i].join(" ") + "\n"
end	
#__________________________________________________________________________________
until false
flag_three = false
until flag_three
	puts "Enter the row number\n"
	row_number = gets().chomp
	puts "Enter the column number\n"
	col_number = gets().chomp
	if row_number.include? '.' or col_number.include? '.'
		#puts "Entered floating point check"
		next
	end	
	begin
		row_number = Integer(row_number)
		col_number = Integer(col_number)
		if row_number.to_i >= file_list.length or row_number.to_i < 0
			#puts "entred this one"
			next
		end
		if col_number.to_i >= file_list[0].length or col_number.to_i < 0
			#puts "entered this two"
			next
		end
		flag_three  = true
		#puts "Flag three set to true"
	rescue
		next		
	end
end
until false
	puts "Print out step by step?\n"
	choice = gets().chomp.downcase
	if choice == "yes" or choice == "no"
		if choice == "yes"
			choice = 1
		elsif choice == "no"
			choice = 0
		end
		break	
	else
		next
	end
end
file_list = fill(file_list, row_number, col_number, choice)
for counter in 0..file_list.length - 1
	puts file_list[counter].join(" ")
end
puts "Go again?"
if gets().chomp.downcase == "no"
	Kernel.exit(false)
end
end
