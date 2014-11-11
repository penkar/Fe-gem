require 'distribution'
module Finance_Engine
	class Black_Scholes
		attr_accessor :current_stock_price, :time, :strike_price, :risk_free_rate, :volatility, :d1, :d2, :call_price, :put_price
		def initialize(hash)
			@current_stock_price = hash[:price]
			@strike_price = hash[:strike]
			@time = hash[:time]
			@risk_free_rate = hash[:riskfree]
			@volatility = hash[:volatility]
			@distr_normal = Distribution::Normal::Ruby_
		end

		def inputs
			puts "{price: ##, strike: ##, time: ##, riskfree:##, volatility: ##}"
		end

		def build_options
			build_call_premium
			build_put_premium
		end

		def build_call_premium
			@d1 = (Math.log(@current_stock_price / @strike_price.to_f) + @time * (@risk_free_rate + ((@volatility ** 2) / 2))/ (@volatility * (@time**0.5)))
			@d2 = (@d1 - (@volatility*(@time**0.5)))
			@call_price = ( @current_stock_price * @distr_normal.cdf(@d1)  ) - (@strike_price * Math::E**(@time * -@risk_free_rate) * @distr_normal.cdf(@d2) )
		end

		def build_put_premium
			@put_price = ( @call_price + ( @strike_price * (Math::E**(@time * -@risk_free_rate)) ) - @current_stock_price )
		end

		def output
			puts "Stock Call Price #{@call_price.round(4)}"
			puts "Stock Put Price #{@put_price.round(4)}"
			puts "Stock Price #{@current_stock_price}"
			puts "Time #{@time}"
			puts "Stock Strike Price #{@strike_price}"
			puts "Stock Risk Free Rate #{@risk_free_rate}"
			puts "Stock Volatility #{@volatility}"
		end
	end
end