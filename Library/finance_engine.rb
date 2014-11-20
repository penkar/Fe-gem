require_relative 'entities/optionpricing.rb'
require_relative 'entities/tvm.rb'
require_relative 'entities/eareay.rb'
require_relative 'entities/annuity.rb'
require_relative 'entities/gordon_growth_model.rb'

module FinanceEngine
	def self.record=(x)
		@record = x
	end	
	def self.record
		@record
	end
end