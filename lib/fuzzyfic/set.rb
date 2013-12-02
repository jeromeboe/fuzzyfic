module Fuzzyfic
	class Set

		def and set
			Condition.new self, set, :and
		end

		def or set
			Condition.new self, set, :or
		end


		def then set
			condition = Condition.new self
			Rule.new condition, set
		end

		# Must be overriden in sub-classes
		def get value		
		end

	end
end