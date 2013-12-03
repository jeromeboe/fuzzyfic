require_relative 'condition'
require_relative 'rule'

module Fuzzyfic
	class Set

		attr_accessor :support

		def initialize 
		end

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
		def get x		
		end

		def get_in_crop x, alpha
			[get(x), alpha].min
		end

	end
end