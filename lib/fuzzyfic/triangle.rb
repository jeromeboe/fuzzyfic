require_relative 'set'

module Fuzzyfic
	class Triangle < Set

		def initialize support, center
			super()
			@support = support
			@center = center
		end

		def get x
			return 0.0 if !x.between?(@support.first, @support.last)
			return 1.0 if x == @center

			if x < @center
				a = 1.0/(@center - @support.first)
				b = 1.0 - a*@center
				return a*x + b
			elsif x > @center
				a = -1.0/(@support.last - @center)
				b = 1.0 - a*@center
				return a*x + b
			end
		end
	end
end