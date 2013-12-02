module Fuzzyfic
	class Triangle < Set

		def initialize support, peak
			super
			@support = support
			@peak = peak
		end

		def get
			1
		end
	end
end