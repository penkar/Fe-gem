module FinanceEngine
	class EAY_EAR
		def self.calculate_effective_annual_yield(annual_rate, periods)
			(1+annual_rate/periods)**(periods)-1
		end

		def self.calculate_effective_annual_rate(annual_yield, periods)
			((annual_yield + 1)**(1/periods)-1)*periods
		end

		def self.calculate_EAY_payment(amt, rate, time, periods)
			amt * ((1+rate/periods)**(time))
		end

		def self.calculate_EAR_payment(amt, rate, time, periods)
			amt * ((1+rate)**(time/periods))
		end

		def self.continuous_compounding(amt,rate,time)
			amt * (Math::E**(rate*time))
		end

		def self.compare_EAR_EAY(amt,rate,time,periods)
			calculate_EAY_payment(amt, rate, time, periods) - calculate_EAR_payment(amt, rate, time, periods)
		end

		def self.compare_EAR_Continuous(amt,rate,time,periods)
			continuous_compounding(amt,rate,time/periods) - calculate_EAR_payment(amt, rate, time, periods)
		end

		def self.compare_EAY_Continuous(amt,rate,time,periods)
			continuous_compounding(amt,rate,time/periods) - calculate_EAY_payment(amt, rate, time, periods)
		end


	end
end