require_relative 'entities/optionpricing.rb'
require_relative 'entities/tvm.rb'

module Finance_Engine
	def self.record=(x)
		@record = x
	end	
	def self.record
		@record
	end
end