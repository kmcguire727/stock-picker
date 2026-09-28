# Stock Picker

Given an array of daily stock prices, returns the best day to buy and the
best day to sell for maximum profit. Solution to The Odin Project's
[Stock Picker](https://www.theodinproject.com/lessons/ruby-stock-picker) exercise.

## Usage

```ruby
require_relative 'stock_picker'

stock_picker([17,3,6,9,15,8,6,1,10])
# => [1, 4]  # buy on day 1 ($3), sell on day 4 ($15), profit $12
```

Returns `[buy_day, sell_day]`. Days are zero-indexed, and the buy day is
always before the sell day.

## How it works

Starting from the last day, treats each day as a candidate sell day and
compares it against every earlier day as a buy day, keeping the pair with
the largest profit. It's a brute-force approach that runs in O(n²) time.

## Behavior notes

- If several trades tie for best profit, returns the one with the latest
  sell day (and the earliest buy day for that sell day).
- If prices never rise (e.g. `[9,5,3,1]`), returns `[0, 0]`.
- Fewer than 2 prices returns `nil`.

## Running the tests

Requires [RSpec](https://rspec.info/).

```
rspec spec/stock_picker_spec.rb
```

Covers the exercise example and the edge cases from the assignment:
lowest price on the last day, highest price on the first day, and the
max-minus-min ordering trap.