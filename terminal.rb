require_relative "board.rb"

class Terminal

	def rows(board_hash)

		empty=Hash.new
			board_hash.each do |key, value|
	 			value = " " if value == ""
	 			"#{key}-----"
   
                empty[:"#{key}"] = value
                # empty[:"#{value}"] = value
                end
                print empty
                # hash.each do |key, array|
                # puts "#{key}-----"
                # puts array
                # end

				# empty.(:key=>value)
				# empty.inject{key,value}
							
# grades = Hash.new

# grades["Bob"] = 82
# grades["Jim"] = 94
# grades["Billy"] = 58
	# 	row = empty.each_slice(3).to_a
	# 		row.each do |here|			
	# 		puts " " + here.join(" ") # X O O
	# 		end			
	end	
end