require_relative '../your_return_calculator'

def test(filename, expected_result)
  file_path = File.expand_path("../#{filename}", __FILE__)
  result = YourReturnCalculator.new(file_path).calculate!.round(4).to_f

  if result == expected_result
    puts "Test passed for #{filename}"
  else
    puts "Test failed for #{filename}: expected #{expected_result}, got #{result}"
  end
end

test('test-0.csv', 0.059)
