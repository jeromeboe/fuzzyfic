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
rules.push service_quality[:bad].or(food[:execrable]).then tips[:low]
rules.push service_quality[:good].then tips[:average]
rules.push service_quality[:excellent].or(food[:delicious]).then tips[:high]


# Compute
mat = Array.new(10){ Array.new(10){0.0} }
for i in (0...10)
	for j in (0...10)
		v = Fuzzyfic::Defuzzifier.cog(rules, i, j)
		puts "Nan : "+i.to_s+", "+j.to_s if v.nan?
		puts "Nil : "+i.to_s+", "+j.to_s if v.nil?
		mat[i][j] = v
	end
end
p mat