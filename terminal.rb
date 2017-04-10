require_relative "gameboard.rb"

class Terminal

	attr_reader :win

	def initialize()
		@win = false
	end

	def check_for_wins(currentBoard, player_name)

		win1 = {a1: "#{player_name}",
			    a2: "#{player_name}",
			    a3: "#{player_name}"}
		win2 = {a1: "#{player_name}",
			    b1: "#{player_name}",
			    c1: "#{player_name}"}
		win3 = {a3: "#{player_name}",
			    b3: "#{player_name}",
			    c3: "#{player_name}"}
		win4 = {c3: "#{player_name}",
			    c2: "#{player_name}",
			    c1: "#{player_name}"}
		win5 = {b3: "#{player_name}",
			    b2: "#{player_name}",
			    b1: "#{player_name}"}
		win6 = {a1: "#{player_name}",
			    b2: "#{player_name}",
			    c3: "#{player_name}"}
		win7 = {a3: "#{player_name}",
			    b2: "#{player_name}",
			    c1: "#{player_name}"}
		win8 = {a2: "#{player_name}",
			    b2: "#{player_name}",
			    c2: "#{player_name}"}

		if currentBoard >= win1 ||
		   currentBoard >= win2 ||
		   currentBoard >= win3 ||
		   currentBoard >= win4 ||
		   currentBoard >= win5 ||
		   currentBoard >= win6 ||
		   currentBoard >= win7 ||
		   currentBoard >= win8 

		    puts " There's a win!"
			puts ""
			puts " #{player_name} wins "
			@win = true
		end
	end

=begin
 The following function "showboard(currentBoard)"
 articulates the display,
 with top & bottom borders;
 with a1 in lower-left corner; and
 with c3 in upper-right corner:
=end
	def showboard(currentBoard)
	        puts ""
	        print "********"
	        puts ""
	        print " " + "#{currentBoard[:a3]}" +
	        	  " " + "#{currentBoard[:b3]}" +
	        	  " " + "#{currentBoard[:c3]}"
	        puts ""
	        print " " + "#{currentBoard[:a2]}" +
	        	  " " + "#{currentBoard[:b2]}" +
	        	  " " + "#{currentBoard[:c2]}"
	        puts ""
	        print " " + "#{currentBoard[:a1]}" +
	        	  " " + "#{currentBoard[:b1]}" +
	        	  " " + "#{currentBoard[:c1]}"
	        puts ""
	        puts ""
	        print "********"
	        puts ""
	end

end