module Finance_Engine
	class Time_Value_Money
		def find_missing_variable(pv=nil, r=nil, fv=nil, n=nil, pmt=nil)
			attributes = {pv:pv,r:r,fv:fv,n:n,pmt:pmt}
		end

		def self.find_fv(hash)
			pv = future_value_cash_flow({cash_flow: hash[:pv], time: hash[:n], rate: hash[:r]})
			pmt = pv_annuity(hash[:pmt], hash[:n], hash[:r])
			fv = pv + pmt
			return fv
		end

		def self.find_pv(hash)
			fv = 0
			pmt = 0
			pv
		end

		def self.find_irr(hash)
		end

		def self.find_n(hash)
		end

		def self.find_pmt(hash)
		end

		def self.pv_annuity(pmt,time,rate)
			pv = 0
			1.upto(time) do |x|
				pv += pmt/((1+rate)**x)
			end
			return pv
		end

		def self.fv_annuity(pmt,time,rate)
			fv = 0
			1.upto(time) do |x|
				fv += pmt * ((1+rate)**(time-x))
			end
			return fv
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
				future_value += future_value_cash_flow({cash_flow: cashflows[x].to_f, rate: rates[x].to_f, time: n - years[x].to_f})
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
				present_value += present_value_cash_flow({cash_flow: cashflows[x].to_f, rate: rates[x].to_f, time: years[x].to_f})
			end
			return present_value
		end
	end
end