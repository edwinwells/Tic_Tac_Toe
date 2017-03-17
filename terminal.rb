require_relative "board.rb"

class Terminal

	def rows(board_hash)

		empty=Hash.new

		board_hash.each do |key, value|
		empty[key] = value

	 		if empty[key] == ""
           	   empty[key] = " "
        	end                
        end
=begin
 The following code articulates the display,
 with top & bottom borders;
 with a1 in lower-left corner; and
 with c3 in upper-right corner:
=end


# print empty
showboard(empty)
check_for_wins(empty)
end

	def check_for_wins(empty)
		if (
			empty[:a1] == "X" &&
		    empty[:a2] == "X" &&
		   	empty[:a3] == "X"
		   	) == true
			puts""
			puts " X wins"
		elsif (
			empty[:a1] == "X" &&
		    empty[:b1] == "X" &&
		   	empty[:c1] == "X"
		   	) == true
			puts""
			puts " X wins"
		


		end




	end

	def showboard(empty)
	        puts ""
	        print "********"
	        puts ""
	        print " " + empty[:c1] + " " + empty[:c2] + " " + empty[:c3]
	        puts ""
	        print " " + empty[:b1] + " " + empty[:b2] + " " + empty[:b3]
	        puts ""
	        print " " + empty[:a1] + " " + empty[:a2] + " " + empty[:a3]
	        puts ""
	        puts ""
	        print "********"
	end

end