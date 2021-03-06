require_relative '../spec_helper.rb'

describe FinanceEngine::American_Options do 
	it 'It should be able to initialize with price, volatility and rate.' do
		first = FinanceEngine::American_Options.new(100,0.2,0.05,90)
		expect(first.rf).to eq(0.05)
		expect(first.vol).to eq(0.2)
		expect(first.price).to eq(100)
		expect(first.strike).to eq(90)
	end

	it 'Can calc the % up and down a stock will go.' do
		first = FinanceEngine::American_Options.new(32,0.2,0.10,90)
		ans = first.up_fac(1.0/12)
		ans = first.down_fac(1.0/12)
		expect(first.up_factor.round(4)).to be_within(0.0005).of(1.0594)
		expect(first.down_factor.round(4)).to be_within(0.0005).of(0.9439)
	end	

	it 'It should be able calculate the correct probability of an increase of price for a 1 month period.' do
		first = FinanceEngine::American_Options.new(32,0.2,0.10,90)
		expect(first.price).to eq(32)
		first.up_fac(1.0/12)
		first.down_fac(1.0/12)
		first.probability_increase_price(1.0/12)
		expect(first.probability.round(4)).to be_within(0.0005).of(0.5576)
	end

	it 'Be able to create tree.' do
		first = FinanceEngine::American_Options.new(32,0.2,0.10,35)
		first.build_american_options(2, 1)
		expect(first.tree['original_dd']['price']).to be_within(0.0005).of(21.450)
		expect(first.tree['original_uu']['price']).to be_within(0.0005).of(47.7384)
	end

	it 'Get american put and call option values.' do
		first = FinanceEngine::American_Options.new(100,0.3,0.05,100)
		first.build_american_options(1, 4)
		expect(first.tree['original_']['put']).to be_within(0.0005).of(13.5240)
		expect(first.tree['original_']['call']).to be_within(0.0005).of(9.535)
	end
end
