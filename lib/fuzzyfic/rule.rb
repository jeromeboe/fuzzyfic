module Fuzzyfic
	class Rule

		def initialize premise, conclusion 
			@premise = premise
			@conclusion = conclusion
		end

		def apply v_left, v_right=nil
			alpha = @premise.apply v_left, v_right
			[@conclusion, alpha]
		end

	end
end