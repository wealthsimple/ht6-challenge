require 'bigdecimal'
require 'csv'
require 'ostruct'

class ReturnCalculator
  attr_reader :snapshots

  def initialize(filename)
    @snapshots = read_snapshots(filename)
  end

  def calculate!
    raise 'Implement Me!'
  end

  private

  def read_snapshots(filename)
    CSV.read(filename).map do |row|
      OpenStruct.new({
        date: Date.parse(row[0]),
        cash_flow: BigDecimal.new(row[1]),
        market_value: BigDecimal.new(row[2]),
      })
    end
  end
end
