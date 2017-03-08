require_relative "board.rb"

class Terminal

	def rows(board_array)

		empty=Array.new
			board_array.each do |element|
				if element == ""
					element = " "
				end
				empty.push(element)
			end

		row = empty.each_slice(3).to_a
			row.each do |here|			
			puts " " + here.join(" ") # X O O
			end			
	end	
end