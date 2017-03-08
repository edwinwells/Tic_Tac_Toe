# newboard=["X", "O", "O"]
newboard=["X", "", "O", "X", "X", "O", "O", "X", "O"]
	newboard.each do |element|
		if element == ""
			element = " "
		# else
		# 	element = element
	end
	end



puts " " + newboard.join(" ")
