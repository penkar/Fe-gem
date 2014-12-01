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
			probability_increase_price(periods_in_year**-1)
			create_tree_for_years(years_to_expiration, periods_in_year**-1)
		end

		def create_tree_for_years(years_to_expiration, periods_in_year, node='original_', price=@price)
			@tree[node]={'price'=>price.round(4)}
			if years_to_expiration.round(3) == 0
				@tree[node]['call'] = call_value(price)
				@tree[node]['put'] = put_value(price)
			elsif years_to_expiration.round(3) > 0
				create_tree_for_years((years_to_expiration - periods_in_year), periods_in_year, node+'u', price * @up_factor )
				create_tree_for_years((years_to_expiration - periods_in_year), periods_in_year, node+'d', price * @down_factor)
				get_put_value(node, periods_in_year)
				get_call_value(node, periods_in_year)
			end
		end

		def get_put_value(node, periods_in_year)
			up = @tree[node+'u']['put']
			down = @tree[node+'d']['put']
			@tree[node]['put'] = (Math::E**(-@rf* periods_in_year)*(@probability * up)+Math::E**(-@rf* periods_in_year)*((1-@probability) * down)).round(4)
		end

		def get_call_value(node, periods_in_year)
			up = @tree[node+'u']['call']
			down = @tree[node+'d']['call']
			@tree[node]['call'] = (Math::E**(-@rf* periods_in_year)*(@probability * up)+Math::E**(-@rf* periods_in_year)*((1-@probability) * down)).round(4)
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

		def current_call_price
			@tree['original_']['call']
		end
		def current_put_price
			@tree['original_']['put']
		end
	end
end