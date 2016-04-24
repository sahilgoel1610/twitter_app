require 'rails_helper'
require 'util'

describe Util do
	describe '#count_hash_of_elements' do
		it 'returns a hash with count of each element in the array' do
			arr = [1,2,2,2,2,3,4,4,4]
			hash = Util.count_hash_of_elements(arr)
			expect(hash[1]).to eq(1)
			expect(hash[2]).to eq(4)
			expect(hash[3]).to eq(1)
			expect(hash[4]).to eq(3)
		end
	end

	describe '#max_value_key' do
		it 'returns the key of the maximum value from the provided hash' do
			hash = {1 => 3, 4 => 5, 2 => 7}
			expect(Util.max_value_key(hash)).to eq(2)
		end
	end
end