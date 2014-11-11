require_relative '../spec_helper.rb'

describe Finance_Engine::Black_Scholes do 
	it 'It should be able to accept variable for the Black Scholes model.' do
		hash = {price: 25, strike: 30, time: 5, riskfree:0.05, volatility: 0.2}
		a = Finance_Engine::Black_Scholes.new(hash)
		expect(a.current_stock_price).to eq(25)	
		expect(a.time).to eq(5)	
		expect(a.strike_price).to eq(30)	
		expect(a.risk_free_rate).to eq(0.05)		
		expect(a.volatility).to eq(0.2)		
	end

	it 'It should be able to calculate put and call prices.' do
		hash = {price: 25, strike: 30, time: 5, riskfree:0.05, volatility: 0.2}
		a = Finance_Engine::Black_Scholes.new(hash)	
		a.build_options
		p a
		expect(a.put_price.round(4)).to eq(3.4068)	
		expect(a.call_price.round(4)).to eq(5.0428)
		expect(a.d1.round(4)).to eq(0.6003)	
		expect(a.d2.round(4)).to eq(0.1531)		
	end
end