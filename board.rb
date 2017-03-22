class Board

	attr_accessor :setup

	def initialize()
		@setup = {
			     :a1 => "", :a2 => "", :a3 => "",
			     :b1 => "", :b2 => "", :b3 => "",
			     :c1 => "", :c2 => "", :c3 => ""
		         }

	end

	def set_position(position, character)
		@setup[:"#{position}"] = character
	end

	def check_position?(position)
		if @setup[:"#{position}"] == " "
			true
		else
			false
		end
	end	

	def check_full?()
		count = 0
		@setup.each do |key, value|
	 		if setup[key] != " "
           	   count += 1
        	end
        end

        if count <9 then false else true end
    end

		def get_X()
			print " X, enter your square! "
			square = gets.chomp

			until check_position?(square) == true do
	        	print " Invalid entry! Try again..."
				puts ""
				print " X, enter your square! "
				square = gets.chomp
			end

			set_position(square,"X")
			puts ""
			puts ""
		end

		def get_O()
			print " O, enter your square! "
			square = gets.chomp

			until check_position?(square) == true do
	        	print " Invalid entry! Try again..."
				puts ""
				print " O, enter your square! "
				square = gets.chomp
			end

			set_position(square,"O")
			puts ""
			puts ""
		end

end