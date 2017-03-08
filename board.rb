class Board

	attr_accessor :setup

	def initialize()
		@setup=Array.new(9, "")
	end

	def set_position(position, character)
		@setup[position] = character
	end

	def check_position?(position)
		if @setup[position] == ""
			true
		else
			false
		end
	end	

	def check_full?()
		@setup.count("") == 0
	end

	def win?()

	end
end




# newboard=Board.new
# # p newboard.setup #["", "", "", "", "", "", "", "", ""]
# newboard=["X", "O", "O", "X", "X", "O", "O", "X", "O"]
# # newboard=["X", "", "O", "X", "X", "O", "O", "X", "O"] provide for empty space!!!

# # p newboard #["X", "O", "O", "X", "X", "O", "O", "X", "O"]
# # puts newboard #X
# # O
# # O
# # X
# # X
# # O
# # O
# # X
# # O
# # print newboard #["X", "O", "O", "X", "X", "O", "O", "X", "O"][Finished in 0.3s]
# rows = newboard.each_slice(3).to_a
# # p rows #[["X", "O", "O"], ["X", "X", "O"], ["O", "X", "O"]]
# # rows.each do |row|
# #   puts " " + row.to_s
# # end
# # p rows[0]  #["X", "O", "O"]
# # puts " " + rows[0].to_s  # ["X", "O", "O"]
# # puts " " + rows[0].join(" ") # X O O
# rows.each do |row|
#   puts " " + row.join(" ")
# end
# # print newboard