def stock_picker(stock_price_array)
  # Jobs to be done: find max profit given the stock price input array
  # Approach:
  # - Copy input array
  # - Pop value, iterate through what is left, subtract that number
  # - Is it greater than what I have (bubble sort style)
  # - If YES => my new max
  # - Else => discard

  stock_prices_by_day = Array.new(stock_price_array)
  increment = stock_prices_by_day.length - 1

  answer = {
    profit_max: 0,
    best_day_to_sell: 0,
    best_day_to_buy: 0,  
  }

  unless stock_prices_by_day.length < 2
    return nil
  end
  
  until increment == 0 do
    # popping will prevent the program from thinking you can buy after you can sell since #each_with_index won't test them because they aren't there
    sell_day_to_test = stock_prices_by_day.pop  

    # after pop, you have the last day left. Assume it's the best day to sell, and find the best day to buy for that sales day.
    # If you find a profit_max that is better than what you have, overwrite what's in the answer hash with it
    stock_prices_by_day.each_with_index do |day, index|
      if (sell_day_to_test - day) > answer[:profit_max]
        answer[:profit_max] = sell_day_to_test - day
        answer[:best_day_to_sell] = increment
        answer[:best_day_to_buy] = index
      end
    
    end

    increment -= 1

  end

  return [answer[:best_day_to_buy], answer[:best_day_to_sell]]

end