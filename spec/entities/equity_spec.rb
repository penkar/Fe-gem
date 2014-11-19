require_relative '../spec_helper.rb'

describe Finance_Engine::Equity do 
	it 'Should be able to calculate value given dividend, growth and rate of return.' do 
		hash = {dividend: 100, rate: 0.05, growth: 0.02}
		a = Finance_Engine::Equity.ggm_value(hash)
		expect(a).to be_within(0.005).of(3333.333)
	end

	it 'Should be able to calculate dividend given value, growth and rate of return.' do 
		hash = {value: 3333.33, rate: 0.05, growth: 0.02}
		a = Finance_Engine::Equity.ggm_growth(hash)
		expect(a).to be_within(0.005).of(100)
	end

	it 'Should be able to calculate rate given value, growth and dividend of return.' do 
		hash = {value: 3333.33, dividend: 100, growth: 0.02}
		a = Finance_Engine::Equity.ggm_rate(hash)
		expect(a).to be_within(0.005).of(0.05)
	end
end