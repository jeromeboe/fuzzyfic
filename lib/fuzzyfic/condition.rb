module Fuzzyfic
	class Condition

		def initialize left, right, operator
			@left = left
			@right = right
			@operator = operator
		end

		def then set
			Rule.new self, set
		end

	end
end