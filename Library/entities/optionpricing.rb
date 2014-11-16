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

		def check_attr
			msg = ''
			msg += "Stock price is missing. " if @current_stock_price.nil?
			msg += "Time period is missing. " if @time.nil?
			msg += "Strike Price is missing. " if @strike_price.nil?
			msg += "Risk free rate is missing. " if @risk_free_rate.nil?
			msg += "Volatility rate is missing. " if @volatility.nil?
			inputs =  "{price: (Dollar Value), strike: (Dollar Value), time: (In Years), riskfree: (RF rate in decimal form (0.05)), volatility: (Volatility Percentage in decimal form (0.20))}"
			# puts inputs if msg.length > 0
			puts msg if msg.length > 0
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