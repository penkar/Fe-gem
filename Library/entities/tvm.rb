module Finance_Engine
	class Time_Value_Money
		def find_missing_variable(pv=nil, r=nil, fv=nil, n=nil, pmt=nil)
			attributes = {pv:pv,r:r,fv:fv,n:n,pmt:pmt}
		end

		def self.find_future_value(hash)
			hash[:pv]
			hash[:pmt]
			hash[:n]
			hash[:r]

		end

		def self.find_present_value(hash)
		end

		def self.find_rate_of_return(hash)
		end

		def self.find_time(hash)
		end

		def self.find_payments(hash)
		end

		def self.future_value_cash_flow(hash)
			cf = hash[:cash_flow]
			rate = hash[:rate]
			time = hash[:time]
			return (cf * ((1 + rate)**time))
		end

		def self.future_value_cash_flows(years, cashflows, rates, n)
			future_value = 0
			years.each_index do |x|
				future_value += self.future_value_cash_flow({cash_flow: cashflows[x].to_f, rate: rates[x].to_f, time: n - years[x].to_f})
			end
			return future_value
		end

		def self.present_value_cash_flow(hash)
			cf = hash[:cash_flow]
			rate = hash[:rate]
			time = hash[:time]
			return (cf / ((1 + rate)**time))
		end

		def self.present_value_cash_flows(years, cashflows, rates)
			present_value = 0
			years.each_index do |x|
				present_value += self.present_value_cash_flow({cash_flow: cashflows[x].to_f, rate: rates[x].to_f, time: years[x].to_f})
			end
			return present_value
		end
	end
end