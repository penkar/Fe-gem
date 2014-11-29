require 'distribution'
module FinanceEngine
	class American_Options
		attr_accessor :price, :vol, :rf, :strike, :time
		def initialize(price, volatility, risk_free_rate, strike)
			@price = price
			@vol = volatility
			@rf = risk_free_rate
			@strike = strike
			# @time = time
		end

		def create_for_years(x)
			
		end

		def up_factor(time)
			Math::E**(@vol*(time/12.0)**(0.5))
		end

		def down_factor(time)
			Math::E**(-@vol*(time/12.0)**(0.5))
		end
		
		def probability_increase_price(time)
			0.5 * (1+(@rf / @vol - @vol/2) *(time/12.0)**(0.5))
		end

	end
end