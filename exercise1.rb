def guess_number_4
	random_number = rand(10)+1
	puts "Guess a number any number"
	guess_number = gets.chomp.to_i
	number_of_tries = 1

	stored_diff = 0
	new_diff = 0

	until guess_number == random_number
		
		if random_number > guess_number
			puts "Nope! The number is larger than your guess."
		elsif random_number < guess_number 
			puts "Nope! The number is smaller than your guess."
		end
		
		guess_number = gets.chomp.to_i

		new_diff = (guess_number - random_number).abs

		if number_of_tries >= 1
			colder_warmer(stored_diff, new_diff)
		end

		
		stored_diff = (guess_number - random_number).abs
		number_of_tries = number_of_tries + 1
	end

	if guess_number == random_number
		puts "YOU GUESSED RIGHT OMGGGG!!! It only took #{number_of_tries} attempts!"
	end
end

def colder_warmer(first_diff, second_diff) #arguments are difference between first guess and num and second guess and num
		if first_diff < second_diff
			puts "You're getting colder!"
		elsif first_diff > second_diff
			puts "You're getting warmer!"
		else
			puts "You're getting neither warmer nor colder ;)"
		end
end



