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

	it 'should be able to calculate a payment using EAR. $1000, 5%, over 2 years compounded monthly.' do
		a = FinanceEngine::EAY_EAR.calculate_EAR_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(1102.50)
	end

	it 'should be able to calculate a payment using EAY. $1000, 5%, over 2 years compounded monthly.' do
		a = FinanceEngine::EAY_EAR.calculate_EAY_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(1104.94)
	end

	it 'Should be able to calculate a payment assuming continuous compounding.' do
		a = FinanceEngine::EAY_EAR.continuous_compounding(1000,0.05,2)
		expect(a).to be_within(0.05).of(1105.17)
	end

	it 'Should be able to calculate the difference between EAR and EAY in dollar amounts.' do
		a = FinanceEngine::EAY_EAR.compare_EAR_EAY_single_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(2.44)
	end

	it 'Should be able to calculate the difference between EAY and continuous in dollar amounts.' do
		a = FinanceEngine::EAY_EAR.compare_EAY_Continuous_single_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(0.23)
	end

	it 'Should be able to calculate the difference between EAR and continuous in dollar amounts.' do
		a = FinanceEngine::EAY_EAR.compare_EAR_Continuous_single_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(2.67)
	end	

	it 'Should be able to calculate the pv of a series of payments using EAR.' do
		a = FinanceEngine::EAY_EAR.calculate_EAR_series(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(25261.28)
	end

	it 'Should be able to calculate the pv of a series of payments using EAR.' do
		a = FinanceEngine::EAY_EAR.calculate_EAY_series(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(25290.86)
	end

	it 'Should be able to calculate the pv of a series of payments using Continuous Compounding.' do
		a = FinanceEngine::EAY_EAR.calculate_CC_series(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(26518.59)
	end

	it 'Should be able to calculate the difference between EAR and EAY series of payment in dollar amounts.' do
		a = FinanceEngine::EAY_EAR.compare_EAR_EAY_series_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(29.58)
	end

	it 'Should be able to calculate the difference between EAY and continuous series of payment in dollar amounts.' do
		a = FinanceEngine::EAY_EAR.compare_EAR_Continuous_series_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(1257.31)
	end

	xit 'Should be able to calculate the difference between EAR and continuous series of payment in dollar amounts.' do
		a = FinanceEngine::EAY_EAR.compare_EAR_Continuous_series_payment(1000,0.05,24,12)
		expect(a).to be_within(0.05).of(2.67)
	end	

end