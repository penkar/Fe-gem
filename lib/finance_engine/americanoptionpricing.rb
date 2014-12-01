require 'distribution'
module FinanceEngine
	class American_Options
		attr_accessor :price, :vol, :rf, :strike, :time, :tree
		def initialize(price, volatility, risk_free_rate, strike)
			@price = price
			@vol = volatility
			@rf = risk_free_rate
			@strike = strike
			@tree = {}
		end

		def create_tree_for_years(price=@price, years, periods_in_year, node='original_')
			if years.round(4) == 0

			elsif year.round(4) > 0
				
			end
		end

		def up_factor(time)
			Math::E**(@vol*(time)**(0.5))
		end

		def down_factor(time)
			Math::E**(-@vol*(time)**(0.5))
		end
		
		def probability_increase_price(time)
			0.5 * (1+(@rf / @vol - @vol/2) *(time)**(0.5))
		end

	end
end