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

		def create_tree_for_years(years, periods_in_year, node='original_', price=@price)
			@tree[node]=price
			if years.round(3) == 0
				return
			elsif years.round(3) > 0
				price_up = price * up_factor(1.0/periods_in_year)
				price_down = price * down_factor(1.0/periods_in_year)
				create_tree_for_years((years - 1.0/periods_in_year), periods_in_year, node+'u', price_up, )
				create_tree_for_years((years - 1.0/periods_in_year), periods_in_year, node+'d', price_down)
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