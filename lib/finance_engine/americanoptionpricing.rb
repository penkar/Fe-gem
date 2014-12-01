require 'distribution'
module FinanceEngine
	class American_Options
		attr_accessor :price, :vol, :rf, :strike, :time, :tree, :up_factor, :down_factor, :probability
		def initialize(price, volatility, risk_free_rate, strike)
			@price = price
			@vol = volatility
			@rf = risk_free_rate
			@strike = strike
			@tree = {}
		end

		def build_american_options(years_to_expiration, periods_in_year)
			up_fac(periods_in_year**-1)
			down_fac(periods_in_year**-1)
			create_tree_for_years(years_to_expiration, periods_in_year)
		end

		def create_tree_for_years(years_to_expiration, periods_in_year, node='original_', price=@price)
			@tree[node]={'price'=>price.round(4), 'call'=> call_value(price), 'put'=>put_value(price)}
			if years_to_expiration.round(3) == 0
				@tree[node]['call'] = call_value(price)
				@tree[node]['put'] = put_value(price)
			elsif years_to_expiration.round(3) > 0
				price_up = price * @up_factor
				price_down = price * @down_factor
				create_tree_for_years((years_to_expiration - 1.0/periods_in_year), periods_in_year, node+'u', price_up )
				create_tree_for_years((years_to_expiration - 1.0/periods_in_year), periods_in_year, node+'d', price_down)
			end
		end

		def put_value(price)
			[0,price - strike].max.round(4)
		end

		def call_value(price)
			[0,strike - price].max.round(4)
		end

		def up_fac(time)
			@up_factor = Math::E**(@vol*(time)**(0.5))
		end

		def down_fac(time)
			@down_factor = Math::E**(-@vol*(time)**(0.5))
		end	
		
		def probability_increase_price(time)
			@probability = (Math::E**(time*@rf)-@down_factor)/(@up_factor - @down_factor)
		end
	end
end