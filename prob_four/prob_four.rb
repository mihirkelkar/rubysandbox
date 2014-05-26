#!/usr/bin/ruby

def menu()
	puts "Enter 1 to calculate the area of circle\n"
	puts "Enter 2 to calculate the surface area of a sphere\n"
	puts "Enter 3 to calculate the volume of a sphere\n"
	puts "Enter 4 to quit"
	return gets().chomp
end

def get_radius()
	puts "Enter the radius"
	radius = gets().chomp
	begin 
		radius = Float(radius)
		if radius < 0
			radius = get_radius()
		end
		
	rescue
		puts "Radius has to be a  number"	
		radius = get_radius()
	end
	return radius
end
until false
go_ahead = false
choice = menu()
until go_ahead
	begin
		choice = Integer(choice)
		if choice < 0 or choice > 4
			puts "Invalid range. Range has to be between 0 and 4. Both included\n"	
			choice = menu()
		else
			go_ahead = true
		end
	rescue
		begin
			choice = Float(choice)
			puts "Has to be an integer not a float\n"
		rescue
			print "Has to be an integer, not a string\n"
		end
		choice = menu()
	end
end	

if choice == 1
	radius = get_radius()
	#puts radius
	area = 3.14 * radius ** 2
	puts area
elsif choice == 2
	radius = get_radius()
	surface_area = 4 * 3.14 * radius ** 2
	puts surface_area
elsif choice == 3
	radius = get_radius()
	volume = (4 * 3.14 * radius ** 3) / 3
	puts volume
elsif choice == 4
	puts "End of program"
	Kernel.exit(false)		
end
end
