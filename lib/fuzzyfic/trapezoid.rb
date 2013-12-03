require_relative 'set'

module Fuzzyfic
	class Trapezoid < Set

		def initialize support, kernel
			super
			@support = support
			@kernel = kernel
		end

		def get x
			return 0.0 if !x.between?(@support.first, @support.last)
			return 1.0 if x.between?(@kernel.first, @kernel.last)

			if x < @kernel.first
				a = 1.0/(@kernel.first - @support.first)
				b = 1.0 - a*@kernel.first
				return a*x + b
			elsif x > @kernel.last
				a = 1.0/(@support.last - @kernel.last)
				b = 1.0 - a*@kernel.last
				return a*x + b
			end
		end

	end
end