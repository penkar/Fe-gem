# FinanceEngine

Finance Engine (Fe) is a hopefully growing open source library to assist in financial calculations and demonstrations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'finance_engine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install finance_engine

## Usage

At the moment there are only five limited modules. Here we will try to demonstrate the basic argument inputs, it is advisable to check the tests for further details.

1) FA = FinanceEngine::Annuity

	FA.present_value_perpetuity(annuity payment in dollars, rate of return, growth rate) - Will return the present value of a perpetuity.

	FA.present_value_annuity(annuity payment in dollars, rate of return, n periods in payment, growth rate) - Will return the present value of an annuity with n periods remaining.

2) FEE = FinanceEngine::EAY_EAR

	FEE.calculate_effective_annual_yield(annual interest rate, compounding periods) - returns the effective annual yield given the effective annual rate and compounding periods.

	FEE.calculate_effective_annual_rate(effective annual yield, compounding periods) - returns the annual rate of return given the effective annual yeld and compounding periods.

	FEE.calculate_EAY_payment(payment amount, effecive annual rate, periods compounded, periods per year) - Calculates the dollar value of a payment in the future with compounding. 

	FEE.calculate_EAR_payment(payment amount, effecive annual rate, periods compounded, periods per year) - Calculates the dollar value of a payment in the future without compounding.
 
	FEE.compare_EAR_EAY(payment amount, effecive annual rate, periods compounded, periods per year) - Calculates the dollar value difference between a payment calculated with effective yield and without.

3) FE = FinanceEngine::Equity

	FE.gordon_growth_model({ :rate => 0.05, :dividend => 100, :growth => 0.02, :value => 3333.33 }) - Using 3 of the 4 input values the Gordon Growth Model method will calculate the 4th input. 

	FE.gordon_growth_model({ :rate => 0.05, :dividend => 100, :growth => 0.02 }) - Will return a value of 3333.33.

4) FBS = FinanceEngine::Black_Scholes

	FBS.new({ :current_stock_price => 100, :time => 5, :strike_price => 95, :risk_free_rate => 0.05, :volatility => 0.25 }) - After initializing a new instance of Black_Scholes run the build options method. This will create and store the put call and price data on the instance of Black Scholes. This is different from the other modules in that it will store the variables in the instance.

5) FTVM = FinanceEngine::Time_Value_Money

	FTVM.present_value_cash_flows(years, cashflows, rates) - Years, cashflows and rates are all arrays matching in length. This method will return the present value of a series of cash flows when given the time, amount and effective interest rates.

	FTVM.future_value_cash_flows(years, cashflows, rates) - Years, cashflows and rates are all arrays matching in length. This method will return the future value of a series of cash flows when given the time, amount and effective interest rates.

6) AO = FinanceEngine::American_Options

	AO.new(Price, Volatility, Risk Free Rate, Strike Price) - Initializes a new instance of the american options storing the price, volatility, rf rate and strike price.
	AO.build(years to expiration, number of periods within that year to exercise options) - this method will build out a binary tree to calculate the current option prices based on the future stock value and strike price.
	AO.current_call_price - returns the calculated current call price.
	AO.current_put_price - returns the calculated current put price.




## Contributing

1. Fork it ( https://github.com/penkar/finance_engine/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

What would be useful? Methods in Time value of money to calculate the rate, and nper.