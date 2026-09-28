def stock_picker(stock_price_array)
  # Jobs to be done: find max profit given the stock price input array
  # Approach:
  # - Copy input array
  # - Pop value, iterate through what is left, subtract that number
  # - Is it greater than what I have (bubble sort style)
  # - If YES => my new max
  # - Else => discard

  stock_prices_by_day = Array.new(stock_price_array)
  answer = {profit_max: 0}
  
  stock_prices_by_day.reverse_each.with_index do |day_price, index|
    stock_prices_by_day.map { |day| day - day_price }
      if stock_prices_by_day.max > answer[:profit_max]
        answer[:best_day_to_sell] = index + (stock_prices_by_day.length - 1)
        answer[:best_day_to_buy] = stock_prices_by_day.index(stock_prices_by_day.max)
        answer[:profit_max] = stock_prices_by_day.max
      end
  end

  puts answer

end

stock_picker([17,3,6,9,15,8,6,1,10])