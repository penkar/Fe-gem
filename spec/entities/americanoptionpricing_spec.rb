require_relative '../spec_helper.rb'

describe FinanceEngine::American_Options do 
	it 'It should be able to initialize with price, volatility and rate.' do
		first = FinanceEngine::American_Options.new(100,0.2,0.05,90)
		expect(first.rf).to eq(0.05)
		expect(first.vol).to eq(0.2)
		expect(first.price).to eq(100)
		expect(first.strike).to eq(90)
	end

	it 'It should be able calculate the correct probability of an increase of price for a 1 month period.' do
		first = FinanceEngine::American_Options.new(32,0.2,0.10,90)
		expect(first.price).to eq(32)
		ans = first.probability_increase_price(1)
		expect(ans.round(4)).to be_within(0.0005).of(0.5574)
	end

end
