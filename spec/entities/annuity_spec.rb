require_relative '../spec_helper.rb'

describe Finance_Engine::Annuity do 
	it 'Should be able to find the present value of a growing or frozen perpetuity.' do
		a = Finance_Engine::Annuity.present_value_perpetuity(100,0.05,0.02)
		expect(a).to be_within(0.05).of(3400)
		b = Finance_Engine::Annuity.present_value_perpetuity(100,0.05)
		expect(b).to be_within(0.05).of(2000)
	end

	it 'Should be able to find the present value of a growing or frozen annuity.' do
		a = Finance_Engine::Annuity.present_value_annuity(100, 0.05, 20, 0.02)
		expect(a).to be_within(0.05).of(1466.55)
		b = Finance_Engine::Annuity.present_value_annuity(100, 0.05, 20)
		expect(b).to be_within(0.05).of(1246.20)
	end
end
