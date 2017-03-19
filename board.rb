class Board

	attr_accessor :setup

	def initialize()
		@setup=Hash.new
		{
			:a1 => "", :a2 => "", :a3 => "",
			:b1 => "", :b2 => "", :b3 => "",
			:c1 => "", :c2 => "", :c3 => ""
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

	def check_full?()
		count = 0
		@setup.each do |key, value|
	 		if setup[key] != ""
           	   count += 1
        	end
        end

        if count <9 then false else true end
    end

end