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

    # Get an array of snapshot pairs: ex. [[day1, day2], [day2, day3]]
    # by zipping an array without the last element to an array without the first element
    sub_periods = snapshots[0...-1].zip(snapshots.drop(1))

    # calculate naive return for each subperiod
    returns = sub_periods.map {|pair| (pair[1].market_value - pair[1].cash_flow)/pair[0].market_value - 1 }
    
    # geometrically link these returns and subtract 1 to calculate the time weighted return
    tw_return = returns.reduce(1) {|total, sub_return| total * (1 + sub_return)} - 1

    BigDecimal.new(tw_return)
  end
end
