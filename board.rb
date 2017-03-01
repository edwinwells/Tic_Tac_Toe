class Board

	attr_accessor :setup

	def initialize()
		@setup=["", "" , "" , "", "", "", "", "", ""]
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

end