require_relative 'return_calculator'

class YourReturnCalculator < ReturnCalculator
  def calculate!
    # Write your code here.
    # You have access to the `snapshots` variable.
    #
    # You can access the following properties of a snapshot:
    # snapshot.date
    # snapshot.cash_flow
    # snapshot.market_value
	a=BigDecimal.new(1)
	snapshots.reduce(snapshots.first)do
	|last,day|
		puts day
		puts last
		if day!=last
			a=(day.market_value-day.cash_flow)/last.market_value*a
		end
	day
	end
	puts a
    BigDecimal.new(a-1)
  end
end
