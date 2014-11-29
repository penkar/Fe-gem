require 'distribution'
module FinanceEngine
	class American_Options
		attr_accessor :price, :vol, :rf
		def initialize(price, volatility, risk_free_rate)
			@price = price
			@vol = volatility
			@rf = risk_free_rate
		end
	end
end