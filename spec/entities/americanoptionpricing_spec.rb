require_relative '../spec_helper.rb'

describe FinanceEngine::American_Options do 
	it 'It should be able to initialize with price, volatility and rate.' do
		first = FinanceEngine::American_Options.new(100,0.2,0.05)
		expect(first.rf).to eq(0.05)
		expect(first.vol).to eq(0.2)
		expect(first.price).to eq(100)
	end
end
