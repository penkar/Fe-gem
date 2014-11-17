module Finance_Engine
	class Annuity
		def self.present_value_perpetuity_growth(annuity, rate, growth=0)
			annuity*(1+growth)/(rate-growth)
		end

		def self.present_value_annuity_growth(annuity, rate, periods, growth)
			return annuity / (rate - growth) *( 1 - ((1+growth)/(1+rate))**periods ) 
		end
	end
end