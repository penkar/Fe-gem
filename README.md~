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

At the moment there are only five limited modules. Here we will try to demonstrate the basic argument inputs, it is advisable to check the tests.
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


4) FBS = FinanceEngine::Black_Scholes


5) FTVM = FinanceEngine::Time_Value_Money







## Contributing

1. Fork it ( https://github.com/[my-github-username]/finance_engine/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
