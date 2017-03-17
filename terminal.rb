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