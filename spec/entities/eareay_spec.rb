require_relative '../spec_helper.rb'

describe FinanceEngine::EAY_EAR do 
	it 'Should be able to calculate Effective Annual Yield' do 
		a = FinanceEngine::EAY_EAR.calculate_effective_annual_yield(0.05, 12)
		expect(a).to be_within(0.005).of(0.0511)
	end

	it 'Should be able to calculate Effective Annual Rate' do 
		a = FinanceEngine::EAY_EAR.calculate_effective_annual_yield(0.0511, 12)
		expect(a).to be_within(0.005).of(0.05)
	end

	it 'should be able to calculate a payment using EAY. $1000, 5%, over 2 years compounded monthly.' do
		a = FinanceEngine::EAY_EAR.calculate_EAY_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(1104.94)
	end

	it 'should be able to calculate a payment using EAR. $1000, 5%, over 2 years compounded monthly.' do
		a = FinanceEngine::EAY_EAR.calculate_EAR_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(1102.50)
	end

	it 'Should be able to calculate the difference between EAR and EAY in dollar amounts.' do
		a = FinanceEngine::EAY_EAR.compare_EAR_EAY(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(2.44)
	end

	xit 'Should be able to calculate the difference between EAY and continuous in dollar amounts.' do
		a = FinanceEngine::EAY_EAR.compare_EAY_Continuous(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(2.44)
	end

	xit 'Should be able to calculate the difference between EAR and continuous in dollar amounts.' do
		a = FinanceEngine::EAY_EAR.compare_EAR_Continuous(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(2.44)
	end	

	it 'Should be able to calculate a payment assuming continuous compounding.' do
		a = FinanceEngine::EAY_EAR.continuous_compounding(1000,0.05,2)
		expect(a).to be_within(0.05).of(1105.17)
	end

end