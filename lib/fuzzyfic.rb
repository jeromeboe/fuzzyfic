require_relative 'fuzzyfic/trapezoid.rb'

module FuzzyLogic

	def self.compute rules, i1, i2
		rules.each do |r|
			r.apply i1, i2
		end
	end

end