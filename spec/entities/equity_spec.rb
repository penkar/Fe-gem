require_relative '../spec_helper.rb'

describe Finance_Engine::Equity do 
	it 'Should be able to calculate value given dividend, growth and rate of return.' do 
		hash = {dividend: 100, rate: 0.05, growth: 0.02}
		a = Finance_Engine::Equity.ggm_value(hash)
		expect(a).to be_within(0.005).of(3333.333)
	end
end