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

    ret = snapshots.map.with_index{|s, i|
        s[:i] = i
        s
    }
    .reduce(Array.new){|ret, s|
        if s[:i] == 0
            ret
        else
            cur = snapshots.at(s[:i])
            prev = snapshots.at(s[:i] - 1)
            e = (cur[:market_value] - cur[:cash_flow]) 
            e /= prev[:market_value]
            e -= 1
            ret.push(e)
        end
    }
    .reduce(1) {|ret, naive|
        ret * (1 + naive)
    } - 1

    BigDecimal.new(ret)
  end
end
