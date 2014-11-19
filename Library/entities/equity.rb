module Finance_Engine
	class Equity
		def self.gordon_growth_model(hash)
			ggm_value(hash) if hash[:value].nil?
		end

		def self.ggm_value(hash)
			hash[:dividend] / (hash[:rate] - hash[:growth])
		end

		def self.ggm_dividend(hash)
			hash[:value] * (hash[:rate] - hash[:growth])
		end

		def self.ggm_rate(hash)
			hash[:growth] + (hash[:dividend] / hash[:value])
		end

		def self.ggm_growth(hash)
			hash[:rate] - (hash[:dividend] / hash[:value])
		end

	end
end