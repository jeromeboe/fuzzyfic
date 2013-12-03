dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'fuzzyfic')

# Variable input 1 : Service quality
service_quality = {
	bad: Fuzzyfic::Trapezoid.new([0,3], [0,2]),
	good: Fuzzyfic::Trapezoid.new([3,7], [4,6]),
	excellent: Fuzzyfic::Trapezoid.new([7,10], [6,10])
}

# Variable input 2 : Food
food = {
	execrable: Fuzzyfic::Trapezoid.new([0,3], [0,1]),
	delicious: Fuzzyfic::Trapezoid.new([7,10], [9,10])
}

# Variable output : Tips
tips = {
	low: Fuzzyfic::Triangle.new([0,10], 5),
	average: Fuzzyfic::Triangle.new([10,20], 15),
	high: Fuzzyfic::Triangle.new([20,30], 25)
}


# Rules
rules = []
rules.push service_quality[:bad].or(nourriture[:execrable]).then tips[:low]
rules.push service_quality[:good].then tips[:average]
rules.push service_quality[:excellent].or(nourriture[:delicious]).then tips[:high]


# Compute
Fuzzyfic::Defuzzifier.cog(rules, 7.83, 7.32)