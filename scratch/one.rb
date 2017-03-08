# newboard=["X", "O", "O", "X", "X", "O", "O", "X", "O"]
newboard=["X", "", "O", "X", "X", "O", "O", "X", "O"]

	def rows(board_array)
		empty=Array.new
		board_array.each do |element|
			if element == ""
				element = " "
			end
			empty.push(element)
		end
		p empty
		rows.each do |row|
		rows = empty.each_slice(3).to_a
			puts " " + row.join(" ")
		end
	end

rows(newboard)
