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