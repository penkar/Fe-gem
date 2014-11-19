module Finance_Engine
	class Equity
		def gordon_growth_model(hash)
			
		end

		def self.ggm_value(hash)
			hash[:dividend] / (hash[:rate] - hash[:growth])
		end

		def self.ggm_growth(hash)
			hash[:value] * (hash[:rate] - hash[:growth])
		end

	end
end