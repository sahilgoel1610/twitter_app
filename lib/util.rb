class Util
	class << self
		
		# returns a hash with count value of each distinct item of array
		def count_hash_of_elements(array_elems)
			array_elems.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
		end

		# returns key of maximum value of hash
		def max_value_key(hash)
			hash.max_by{|k,v| v}.first
		end
	
	end
end