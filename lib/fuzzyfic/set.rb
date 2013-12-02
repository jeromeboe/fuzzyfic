module Fuzzyfic
	class Set

		def and set
			Condition.new self, set, :and
		end

		# Occurs when no operator is needed
		def then set
			condition = Condition.new self, nil, nil
			Rule.new condition, set
		end

	end
end