module Fuzzyfic
	class Trapezoid < Set

		def initialize support, kernel
			super
			@support = support
			@kernel = kernel
		end

		def get
			1
		end

	end
end