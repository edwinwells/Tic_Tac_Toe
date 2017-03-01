class Board

	attr_accessor :board

	def initialize()
		@board=["", "" , "" , "", "", "", "", "", ""]
	end

	def set_position(position, character)
		@board[position] = character
	end
end