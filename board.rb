class Board

	attr_accessor :setup

	def initialize()
		@setup=Hash.new
		{
			:a1=> "",:a2=> "",:a3=> "",
			:b1=> "",:b2=> "",:b3=> "",
			:c1=> "",:c2=> "",:c3=> ""
		}

	end

	def set_position(position, character)
		@setup[:"#{position}"] = character
	end

	def check_position?(position)
		if @setup[:"#{position}"] == ""
			true
		else
			false
		end
	end	

	# def check_full?()
	# 	@setup.count("") == 0
	# end

end