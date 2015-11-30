class Oystercard
	attr_reader :balance

	MAX_BALANCE = 90

	def initialize
		@balance = 0
	end

	def top_up(n)
		fail "Limit exceeded: The limit is #{MAX_BALANCE}" if (@balance + n) > MAX_BALANCE
		@balance += n
	end

	def deduct(n)
		@balance -= n
	end
end
