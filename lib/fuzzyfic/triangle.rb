require_relative 'set'

module Fuzzyfic
	class Triangle < Set

		def initialize support, peak
			super()
			@support = support
			@peak = peak
		end

		def get x
			return 0.0 if !x.between?(@support.first, @support.last)
			return 1.0 if x == @peak

			if x < @peak
				a = 1.0/(@peak - @support.first)
				b = 1.0 - a*@peak
				return a*x + b
			elsif x > @peak
				a = -1.0/(@support.last - @peak)
				b = 1.0 - a*@peak
				return a*x + b
			end
		end
	end
end