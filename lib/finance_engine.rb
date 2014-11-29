require "finance_engine/version"
require_relative 'finance_engine/americanoptionpricing.rb'
require_relative 'finance_engine/optionpricing.rb'
require_relative 'finance_engine/tvm.rb'
require_relative 'finance_engine/eareay.rb'
require_relative 'finance_engine/annuity.rb'
require_relative 'finance_engine/gordon_growth_model.rb'

module FinanceEngine
	def self.record=(x)
		@record = x
	end	
	def self.record
		@record
	end
end
