module Fuzzyfic
	class Rule

		def initialize premise, conclusion 
			@premise = premise
			@conclusion = conclusion
		end

		def apply v_left, v_right=nil
			img_conslusion = @premise.apply v_left, v_right
			[@conclusion, img_conslusion]
		end

	end
end