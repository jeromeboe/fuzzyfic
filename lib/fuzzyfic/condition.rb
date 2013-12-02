module Fuzzyfic
	class Condition

		attr_accessor :left, :right, :operator

		def initialize left, right=nil, operator=nil
			@left = left
			@right = right
			@operator = operator
		end

		def then set
			Rule.new self, set
		end

		def apply v_left, v_right=nil
			img_left = @left.get v_left
			img_right = @right.get v_right if !@right.nil?

			case @premise.operator
			when nil
				img_left
			when :and
				[img_left, img_right].min
			when :or
				[img_left, img_right].max
			when :not
				1 - img_left
			end
		end

	end
end