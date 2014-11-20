module FinanceEngine
	class Equity
		def self.gordon_growth_model(hash)
			return ggm_value(hash) if hash[:value].nil?
			return ggm_dividend(hash) if hash[:dividend].nil?
			return ggm_rate(hash) if hash[:rate].nil?
			return ggm_growth(hash) if hash[:growth].nil?
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