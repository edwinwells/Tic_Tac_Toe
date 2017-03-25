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

	def check_for_wins(empty, player_name)

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

		if  (empty >= win1) == true ||
            (empty >= win2) == true ||
            (empty >= win3) == true ||
            (empty >= win4) == true ||
            (empty >= win5) == true ||
            (empty >= win6) == true ||
            (empty >= win7) == true ||
            (empty >= win8) == true
		    puts "There's a win!"
			puts ""
			puts " #{player_name} wins "
			@win = true
		end
	end

=begin
 The following code articulates the display,
 with top & bottom borders;
 with a1 in lower-left corner; and
 with c3 in upper-right corner:
=end
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

end