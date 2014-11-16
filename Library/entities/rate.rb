module Finance_Engine
	class Rate
		def self.calculate_effective_annual_yield(annual_rate, periods)
			return (1+annual_rate/periods)**(periods)-1
		end

		def self.calculate_effective_annual_rate(annual_yield, periods)
			return ((annual_yield + 1)**(1/periods)-1)*periods
		end

		def self.calculate_EAY_payment(amt, rate, time, periods)
			return amt * ((1+rate/periods)**(time))
		end

		def self.calculate_EAR_payment(amt, rate, time, periods)
			return amt * ((1+rate)**(time/periods))
		end


	end
end