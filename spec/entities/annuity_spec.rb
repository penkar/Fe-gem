require_relative '../spec_helper.rb'

describe Finance_Engine::Annuity do 
	it 'Should be able to find the present value of a growing, or frozen perpetuity.' do
		a = Finance_Engine::Annuity.present_value_perpetuity_growth(100,0.05,0.02)
		expect(a).to be_within(0.05).of(3400)
		b = Finance_Engine::Annuity.present_value_perpetuity_growth(100,0.05)
		expect(b).to be_within(0.05).of(2000)
	end

	xit 'Should be able to find the present value of a perpetuity.' do
		hash = {cash_flow: 100}
		expect(a)
	end
end
