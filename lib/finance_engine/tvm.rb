module FinanceEngine
	class Time_Value_Money
		def self.find_missing_variable(hash)
			# attributes = {pv: present value, r: internal rate of return, fv: future value, n: number of payment periods, pmt: payment amount}
			return find_fv(hash) if hash[:fv].nil?
			return find_pv(hash) if hash[:pv].nil?
			return find_r(hash) if hash[:r].nil?
			return find_n(hash) if hash[:n].nil?
			return find_pmt(hash) if hash[:pmt].nil?
		end

		def self.find_fv(hash)
			pv = future_value_cash_flow({cash_flow: hash[:pv], time: hash[:n], rate: hash[:r]})
			pmt = fv_annuity(hash[:pmt], hash[:n], hash[:r])
			fv = pv.to_f + pmt.to_f
			return fv
		end

		def self.find_pv(hash)
			fv = present_value_cash_flow({cash_flow: hash[:fv], time: hash[:n], rate: hash[:r]})
			pmt = pv_annuity(hash[:pmt], hash[:n], hash[:r])
			pv = pmt + fv
			return pv
		end

		# def self.find_r(hash)
		# 	r = (hash[:fv]/hash[:pv])**((1/hash[:n])-1).to_f
		# 	return r/100
		# end

		# def self.find_n(hash)
		# 	# n = Math.log(1 - (hash[:fv]*hash[:r]/ hash[:pmt])) / Math.log(1+ hash[:r])
		# 	# n += Math.log(hash[:fv]/hash[:pv]) / Math.log(1+ hash[:r])
		# 	n = ((( hash[:pmt] *(1+hash[:r]) + -hash[:fv]/hash[:r]) / (hash[:pv] * hash[:r] + hash[:pmt]*(1+ hash[:r])))**(0.5))/((1+hash[:r])**(0.5))*100

		# 	return n.round(4)
		# end

		#Calculates the annuity payment amount given the present value, future value, interest rate and amount of periods.
		def self.find_pmt(hash)
			 # r[(PV - FV)/((1 + r)^n - 1) + PV] 
			# binding.pry
			pmt = hash[:r] * ((hash[:pv] - hash[:fv])/((1+hash[:r])**(hash[:n])-1) + hash[:pv])
			return pmt
		end

		#Calculates the present value of an annuity. Both formulas below, non-loop in use.
		def self.pv_annuity(pmt,time,rate)
			pv = pmt*(1-(1+rate)**-time)/rate
			# pv = 0
			# 1.upto(time) do |x|
			# 	pv += pmt / ((1+rate)**x)
			# end
			return pv
		end

		#Calculates the future value of an annuity. Both formulas below, non-loop in use.
		def self.fv_annuity(pmt,time,rate)
			fv = pmt*((1+rate)**time -1)/rate
			# fv = 0
			# 1.upto(time) do |x|
			# 	fv += pmt * ((1+rate)**(time-x))
			# end
			return fv
		end
			
		#Future value of a single cash flow taking in amount, rate and time as factors.
		def self.future_value_cash_flow(hash)
			cf = hash[:cash_flow]
			rate = hash[:rate]
			time = hash[:time]
			return (cf * ((1 + rate)**time))
		end

		#Future value of a series of cash flows. Assumes payment occur at the end of period (inarrears).
		def self.future_value_cash_flows(years, cashflows, rates, n)
			future_value = 0
			years.each_index do |x|
				future_value += future_value_cash_flow({cash_flow: cashflows[x].to_f, rate: rates[x].to_f, time: n - years[x].to_f})
			end
			return future_value
		end

		#Present value of a single cash flow with hash input of amount, rate and time.
		def self.present_value_cash_flow(hash)
			cf = hash[:cash_flow]
			rate = hash[:rate]
			time = hash[:time]
			return (cf / ((1 + rate)**time))
		end

		#Present value of a series of cash flows assuming varying interest rates.
		def self.present_value_cash_flows(years, cashflows, rates)
			present_value = 0
			years.each_index do |x|
				present_value += present_value_cash_flow({cash_flow: cashflows[x].to_f, rate: rates[x].to_f, time: years[x].to_f})
			end
			return present_value
		end
	end
end