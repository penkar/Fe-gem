module Finance_Engine
	class Annuity
		def self.present_value_perpetuity(annuity, rate, growth=0)
			annuity*(1+growth)/(rate-growth)
		end

		def self.present_value_annuity(annuity, rate, periods, growth=0)
			annuity /(rate - growth) *( 1 - ((1+growth)/(1+rate))**periods ) 
		end
	end
end