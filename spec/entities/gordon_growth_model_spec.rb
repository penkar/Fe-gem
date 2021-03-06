require_relative '../spec_helper.rb'

describe FinanceEngine::Equity do 
	it 'Should be able to calculate value given dividend, growth and rate of return.' do 
		hash = {dividend: 100, rate: 0.05, growth: 0.02}
		a = FinanceEngine::Equity.ggm_value(hash)
		expect(a).to be_within(0.005).of(3333.333)
	end

	it 'Should be able to calculate dividend given value, growth and rate of return.' do 
		hash = {value: 3333.33, rate: 0.05, growth: 0.02}
		a = FinanceEngine::Equity.ggm_dividend(hash)
		expect(a).to be_within(0.005).of(100)
	end

	it 'Should be able to calculate rate given value, growth and dividend of return.' do 
		hash = {value: 3333.33, dividend: 100, growth: 0.02}
		a = FinanceEngine::Equity.ggm_rate(hash)
		expect(a).to be_within(0.005).of(0.05)
	end

	it 'Should be able to calculate growth given value, rate and dividend of return.' do 
		hash = {value: 3333.33, dividend: 100, rate: 0.05}
		a = FinanceEngine::Equity.ggm_growth(hash)
		expect(a).to be_within(0.005).of(0.02)
	end

	it 'Should be able to calculate value, rate, div or growth depending on what is missing.' do 
			hash = {dividend: 100, rate: 0.05, growth: 0.02}
		a = FinanceEngine::Equity.gordon_growth_model(hash)
		expect(a).to be_within(0.005).of(3333.333)
			hash = {value: 3333.33, rate: 0.05, growth: 0.02}
		b = FinanceEngine::Equity.gordon_growth_model(hash)
		expect(b).to be_within(0.005).of(100)
			hash = {value: 3333.33, dividend: 100, growth: 0.02}
		c = FinanceEngine::Equity.gordon_growth_model(hash)
		expect(c).to be_within(0.005).of(0.05)
			hash = {value: 3333.33, dividend: 100, rate: 0.05}
		d = FinanceEngine::Equity.gordon_growth_model(hash)
		expect(d).to be_within(0.005).of(0.02)
	end
end