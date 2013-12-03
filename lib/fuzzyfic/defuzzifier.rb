module Fuzzyfic
	class Defuzzifier

		def self.cog rules, i1, i2
			## Compute intermediate results for every rules
			intermediate = []
			rules.each do |r|
				intermediate.push r.apply(i1, i2)
			end

			
			## COG method (centroid)

			# compute support interval
			mins = []
			maxs = []
			intermediate.each do |i|
				mins.push i.first.support.min
				maxs.push i.first.support.max
			end

			support_min = mins.min
			support_max = maxs.max

			# compute cog : \frac{\sum_{x \in support} x*f(x)}{\sum_{x \in support} f(x)}
			num = denum = 0.0
			for x in (support_min..support_max)

				# compute f(x) : get the maximum from all conclusion rules (as a fusion)
				images = []
				intermediate.each do |i|
					images.push [i.first.get(x), i.last].min
				end
				fx = images.max

				num += x*fx
				denum += fx
			end

			return num/denum
		end

	end
end