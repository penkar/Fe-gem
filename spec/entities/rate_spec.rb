require_relative '../spec_helper.rb'

describe Finance_Engine::Rate do 
	it 'Should be able to calculate Effective Annual Yield' do 
		a = Finance_Engine::Rate.calculate_effective_annual_yield(0.05, 12)
		expect(a).to be_within(0.005).of(0.0511)

	end
end