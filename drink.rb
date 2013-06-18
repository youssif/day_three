def can_you_drink?(age, sex)
	if age >= 21
		"You are able to drink."
	elsif age > 18 && sex == 'female'
		"I'll buy you a drink!"
	else 
		"You cannot drink."
	end
end

def is_twenty(age)
	
end