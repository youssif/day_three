#problem is that same row for every true statement

puts "Welcome to invisible minesweeper! How many spaces do you want your board to be? We'll try and get it as close as possible. No promises...."
@spaces_squareroot = Math.sqrt(gets.chomp.to_i).to_i
total_spaces = @spaces_squareroot ** 2

@minefield = [] #the actual minefield, push rows arrays into this
rows = [] #this needs to have the right number of falses
row = 0 #will use this in loop to get the right number of arrays

def cheating(minefield)
	minefield.each do |row|
		row.each do |column|
			print "#{column} "
		end
		puts " "
	end
end

while rows.length < @spaces_squareroot
	rows.push(false)
	row = row + 1
end

row.times do
	@minefield.push(rows)
end

number_of_spaces = total_spaces

puts "Thanks. We are going to use #{total_spaces} spaces for this. How many mines do you want in your minefield?"

number_of_mines = gets.chomp.to_i

if number_of_mines > number_of_spaces
	puts "You can't have more mines than number of spaces!!!! >:("
	number_of_mines = gets.chomp.to_i
elsif number_of_mines == number_of_spaces
	puts "You can't have a mine on every space......"
	number_of_mines = gets.chomp.to_i
end	

require 'set'

mines_on_field = Set.new

until mines_on_field.size >= number_of_mines
	space_number_for_mine = rand(number_of_spaces)
	mines_on_field << space_number_for_mine
end

mines_on_field.each do |mine_number|
     minefield_row_number = mine_number / @spaces_squareroot
     minefield_column_number = mine_number % @spaces_squareroot
     minefield_row = @minefield[minefield_row_number] # This is like minefield[0]
     minefield_row[minefield_column_number] = true   # This is like minefield[0][3] = true     
end

def ask_user_mine
	puts "There are #{@spaces_squareroot} rows and #{@spaces_squareroot} columns. You just can't see them. Which row would you like to guess does not have a mine?"
	@user_row_guess = gets.chomp.to_i - 1
	puts "Cool. And which column do you wanna guess doesn't have a mine?"
		if gets.chomp == "Youssif is awesome"
			cheating(@minefield)
		else
			@user_column_guess = gets.chomp.to_i - 1
		end
end



ask_user_mine

while @minefield[@user_row_guess][@user_column_guess] != true #while the space selected does not have a bomb
	if @minefield[@user_row_guess][@user_column_guess] == nil
		puts "Duuuude, you already picked that one!"
		ask_user_mine
	else
		puts "Still alive :)"
		@minefield[@user_row_guess][@user_column_guess] = nil
		ask_user_mine
	end
end		

if @minefield[@user_row_guess][@user_column_guess] == true
	puts "You just blew up. GAME OVER!"
end





	