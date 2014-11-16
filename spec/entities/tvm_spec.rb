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
		hash = {cash_flow: 1000, time: 5, rate: 0.1}
		a = Finance_Engine::Time_Value_Money.future_value_cash_flow(hash)
		expect(a).to be_within(1).of(1610.0)
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

	it "Should be able to calculate the PV of an Annuity." do 
		a = Finance_Engine::Time_Value_Money.pv_annuity(100, 1, 0.1)
		expect(a).to be_within(1).of(90)
		a = Finance_Engine::Time_Value_Money.pv_annuity(100, 5, 0.1)
		expect(a).to be_within(1).of(379)
	end

	it "Should be able to calculate the FV of an Annuity." do 
		a = Finance_Engine::Time_Value_Money.fv_annuity(100, 1, 0.1)
		expect(a).to be_within(1).of(100)
		a = Finance_Engine::Time_Value_Money.fv_annuity(100, 2, 0.1)
		expect(a).to be_within(1).of(210)
		a = Finance_Engine::Time_Value_Money.fv_annuity(100, 5, 0.1)
		expect(a).to be_within(1).of(610)
	end

	it "Should be able to calculate the FV given n, t, r, and pv." do 
		hash = {pv: 1000,r: 0.10, n:5, pmt: 100}
		a = Finance_Engine::Time_Value_Money.find_fv(hash)
		expect(a).to be_within(1).of(2221)
		hash = {pv: 0,r: 0.10, n:5, pmt: 100}
		a = Finance_Engine::Time_Value_Money.find_fv(hash)
		expect(a).to be_within(1).of(610)
		hash = {pv: 1000,r: 0.10, n:5, pmt: 0}
		a = Finance_Engine::Time_Value_Money.find_fv(hash)
		expect(a).to be_within(1).of(1610)
	end

	it "Should be able to calculate the PV given n, t, r, and fv." do 
		hash = {fv: 1000, r: 0.10, n:5, pmt: 0}
		a = Finance_Engine::Time_Value_Money.find_pv(hash)
		expect(a).to be_within(1).of(620)
		hash = {fv: 0, r: 0.10, n:5, pmt: 100}
		a = Finance_Engine::Time_Value_Money.find_pv(hash)
		expect(a).to be_within(1).of(380)
		hash = {fv: 1000, r: 0.10, n:5, pmt: 100}
		a = Finance_Engine::Time_Value_Money.find_pv(hash)
		expect(a).to be_within(1).of(1000)
	end

	it "Should be able to calculate the payment given all else." do 
		hash = {fv: 0, n: 4, pv:-100, r: 0.1}
		a = Finance_Engine::Time_Value_Money.find_pmt(hash)
		expect(a).to be_within(1).of(-31)
		hash = {fv: 1000, n: 10, pv:0, r: 0.1}
		a = Finance_Engine::Time_Value_Money.find_pmt(hash)
		expect(a).to be_within(1).of(-62.75)
		hash = {fv: -1000, n: 10, pv:1000, r: 0.1}
		a = Finance_Engine::Time_Value_Money.find_pmt(hash)
		expect(a).to be_within(1).of(225.75)
	end

	xit "Should be able to calculate the rate given all else." do 
		hash = {fv: 200, n: 5, pv:-200, pmt: 10}
		a = Finance_Engine::Time_Value_Money.find_r(hash)
		expect(a).to eq(0.05)
	end

	xit "Should be able to calculate the N given pv, pmt, r, and fv." do 
		hash = {fv: 200, r: 0.10, pv:-50, pmt: 100}
		a = Finance_Engine::Time_Value_Money.find_n(hash)
		expect(a).to eq(1)
	end

	it 'Should be able to figure out what is missing from a set of parameters and start calc to figure out missing value.' do
		a = Finance_Engine::Time_Value_Money.find_missing_variable({fv: 1000, r: 0.10, n:5, pmt: 0})
		expect(a).to be_within(1).of(620)
		b = Finance_Engine::Time_Value_Money.find_missing_variable({pv: 1000,r: 0.10, n:5, pmt: 100})
		expect(b).to be_within(1).of(2221)
		c = Finance_Engine::Time_Value_Money.find_missing_variable({fv: -1000, n: 10, pv:1000, r: 0.1})
		expect(c).to be_within(1).of(225.75)
		# d = Finance_Engine::Time_Value_Money.find_missing_variable({})

		# e = Finance_Engine::Time_Value_Money.find_missing_variable({})

	end
end