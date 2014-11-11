require_relative '../spec_helper.rb'

describe Finance_Engine::Time_Value_Money do 
	it 'Should be able to calculate a single cash flow\'s present value.' do
		hash = {cash_flow: 100, time: 1, rate: 0.10}
		a = Finance_Engine::Time_Value_Money.present_value_cash_flow(hash)
		expect(a.round(4)).to eq(90.9091)
		hash = {cash_flow: 1000, time: 2, rate: 0.05}
		a = Finance_Engine::Time_Value_Money.present_value_cash_flow(hash)
		expect(a.round(4)).to eq(907.0295)
	end

	it "Should be able to calculate the present value of a series of cash flows." do 
		years = [0,1,2,3,4]
		cashflows = [-1000,250,250,250,250]
		rates = [0.01,0.01,0.01,0.01,0.01]
		a = Finance_Engine::Time_Value_Money.present_value_cash_flows(years, cashflows, rates)
		expect(a.round(4)).to be_within(1).of(-24)
		year1 = [1]; cashflow1 = [100]; rate1 = [0.1]
		b = Finance_Engine::Time_Value_Money.present_value_cash_flows(year1, cashflow1, rate1)
		expect(b.round(4)).to be_within(1).of(90)
	end

	it 'It should be able to calculate a single cash flow\'s future value.' do
		hash = {cash_flow: 100, time: 2, rate: 0.10}
		a = Finance_Engine::Time_Value_Money.future_value_cash_flow(hash)
		expect(a.round(4)).to be_within(1).of(121.0)
		hash = {cash_flow: 100, time: 1, rate: 0.1}
		a = Finance_Engine::Time_Value_Money.future_value_cash_flow(hash)
		expect(a.round(4)).to eq(110.0)
	end	

	it "Should be able to calculate the future value of a series of cash flows." do 
		years = [0,1,2,3,4]; cashflows = [-1000,250,250,250,250]; rates = [0.01,0.01,0.01,0.01,0.01]
		a = Finance_Engine::Time_Value_Money.future_value_cash_flows(years, cashflows, rates,4)
		expect(a.round(4)).to be_within(1).of(-25)
		year1 = [0]; cashflow1 = [100]; rate1 = [0.1]
		b = Finance_Engine::Time_Value_Money.future_value_cash_flows(year1, cashflow1, rate1,1)
		expect(b.round(4)).to be_within(1).of(110)
		year1 = [1]; cashflow1 = [100]; rate1 = [0.1]
		b = Finance_Engine::Time_Value_Money.future_value_cash_flows(year1, cashflow1, rate1,2)
		expect(b.round(4)).to be_within(1).of(110)
	end
end