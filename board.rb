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

	def check_for_wins(empty)
		if (
			empty[:a1] == "X" &&
		    empty[:a2] == "X" &&
		   	empty[:a3] == "X"
		   	) == true

			win_for_X()

		elsif (
			   empty[:a1] == "X" &&
		       empty[:b1] == "X" &&
		   	   empty[:c1] == "X"
		   	  ) == true

			  win_for_X()

		elsif (
			   empty[:a3] == "X" &&
		       empty[:b3] == "X" &&
		   	   empty[:c3] == "X"
		   	  ) == true

			  win_for_X()

		elsif (
			   empty[:c3] == "X" &&
		       empty[:c2] == "X" &&
		   	   empty[:c1] == "X"
		   	  ) == true

			  win_for_X()

		elsif (
			   empty[:b3] == "X" &&
		       empty[:b2] == "X" &&
		   	   empty[:b1] == "X"
		   	  ) == true

			  win_for_X()

		elsif (
			   empty[:a1] == "X" &&
		       empty[:b2] == "X" &&
		   	   empty[:c3] == "X"
		   	  ) == true

			  win_for_X()

		elsif (
			   empty[:a3] == "X" &&
		       empty[:b2] == "X" &&
		   	   empty[:c1] == "X"
		   	  ) == true

			  win_for_X()

		elsif (
			   empty[:a2] == "X" &&
		       empty[:b2] == "X" &&
		   	   empty[:c2] == "X"
		   	  ) == true

			  win_for_X()

		elsif (
			    empty[:a1] == "O" &&
		        empty[:a2] == "O" &&
		   	    empty[:a3] == "O"
		   	   ) == true

			   win_for_O()

		elsif (
			   empty[:a1] == "O" &&
		       empty[:b1] == "O" &&
		   	   empty[:c1] == "O"
		   	  ) == true

			  win_for_O()

		elsif (
			   empty[:a3] == "O" &&
		       empty[:b3] == "O" &&
		   	   empty[:c3] == "O"
		   	  ) == true

			  win_for_O()

		elsif (
			   empty[:c3] == "O" &&
		       empty[:c2] == "O" &&
		   	   empty[:c1] == "O"
		   	  ) == true

			  win_for_O()

		elsif (
			   empty[:b3] == "O" &&
		       empty[:b2] == "O" &&
		   	   empty[:b1] == "O"
		   	  ) == true

			  win_for_O()

		elsif (
			   empty[:a1] == "O" &&
		       empty[:b2] == "O" &&
		   	   empty[:c3] == "O"
		   	  ) == true

			  win_for_O()

		elsif (
			   empty[:a3] == "O" &&
		       empty[:b2] == "O" &&
		   	   empty[:c1] == "O"
		   	  ) == true

			  win_for_O()

		elsif (
			   empty[:a2] == "O" &&
		       empty[:b2] == "O" &&
		   	   empty[:c2] == "O"
		   	  ) == true

			  win_for_O()																
		end
	end

		def win_for_X()
			puts""
			puts " X wins"
			win = true
		end

		def win_for_O()
			puts""
			puts " O wins"
			win = true
		end

		def get_X(newgame)
			print " X, enter your square!"
			square = gets.chomp

			until newgame.check_position?(square) == true do
	        	print " Invalid entry! Already occupied."
				puts ""
				print " X, enter your square!"
				square = gets.chomp
			end

			newgame.set_position(square,"X")
			puts ""
			print newgame.setup
			puts ""
		end

		def get_O(newgame)
			print " O, enter your square!"
			square = gets.chomp

			until newgame.check_position?(square) == true do
	        	print " Invalid entry! Already occupied."
				puts ""
				print " O, enter your square!"
				square = gets.chomp
			end

			newgame.set_position(square,"O")
			puts ""
			print newgame.setup
			puts ""
		end

end