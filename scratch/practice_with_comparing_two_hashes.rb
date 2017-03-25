# current_game = {:a1 => "X", :a2 => "X", :a3 => "X", :b1 => "O"}

# winone = {:a1 => "X", :a2 => "X", :a3 => "X", :b1 => "O"}

# puts current_game
# puts winone

# if current_game.eql?(winone)
# 	print "equal!"
# end

# hash1 = {a: "2", b: "34", c: "53", d: "23", e: "2"}
# hash2 = {a: "5", c: "8", d: "3", e: "2", f: "76"}

# hash1_1 = hash1.select{|k,_| hash2.has_key? k} 
# # => {:a=>"2", :c=>"53", :d=>"23", :e=>"2"}
# hash1_2 = hash2.select{|k,_| hash1.has_key? k}
# # => {:a=>"5", :c=>"8", :d=>"3", :e=>"2"}

hash1 = {a1: "X", b1: "O", c1: "O", a2: "X", b2: "O", c2: "O", a3: "X", b3: "X", c3: "X"}

hash2 = {a1: "X", a2: "X", a3: "X"}
puts hash1
puts hash2
	puts "true" if hash1 >= hash2
puts""
puts""

 # puts hash1.count(value="X")

# hash1_1 = hash1.select{|k,_| hash2.has_key? k}
# puts hash1_1 
# puts""
# hash1_2 = hash2.select{|k,_| hash1.has_key? k}
# puts hash1_2

# hash1_1 = hash1.select{|k,v| hash2.include(|k,v| v= "X")}
# puts hash1_1 

# { a: 1, b: 2 } >= { a: 1 }
# => true