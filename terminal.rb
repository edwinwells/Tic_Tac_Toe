require_relative "board.rb"

class Terminal

	attr_reader :win

	def initialize()
		@win = false
	end

	def rows(board_hash)

		empty=Hash.new

		board_hash.each do |key, value|
		empty[key] = value
 		if empty[key] == ""
           	   empty[key] = " "
        	end                
      	end
       empty
     end
=begin
 The following code articulates the display,
 with top & bottom borders;
 with a1 in lower-left corner; and
 with c3 in upper-right corner:
=end

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
			puts " X wins "
			@win = true
		end

		def win_for_O()
			puts""
			puts " O wins "
			@win = true
		end

	def showboard(empty)
	        puts ""
	        print "********"
	        puts ""
	        print " " + empty[:a3] +
	        	  " " + empty[:b3] +
	        	  " " + empty[:c3]
	        puts ""
	        print " " + empty[:a2] +
	        	  " " + empty[:b2] +
	        	  " " + empty[:c2]
	        puts ""
	        print " " + empty[:a1] +
	        	  " " + empty[:b1] +
	        	  " " + empty[:c1]
	        puts ""
	        puts ""
	        print "********"
	end

	def game_over?(board)
		if  check_for_wins(board) !=  win_for_X() &&
		    check_for_wins(board) !=  win_for_O()
		    false
		else 
			true
		end
	end

end