require_relative 'set'

module Fuzzyfic
	class Gaussian < Set

		def initialize support, center, width 
			super()
			@support = support
			@center = center
			@width = width
		end

		def get x
			return 0.0 if !x.between?(@support.first, @support.last)
			Math.exp(-((x-@center)**2)*1.0/(2*@width**2))
		end
	end
end