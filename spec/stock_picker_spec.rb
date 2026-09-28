require 'spec_helper'
require_relative '../stock_picker'

RSpec.describe 'stock_picker' do
    it 'Exercise-provided test' do
      expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eq([1,4])
    end

    it 'Lowest price on the last day' do
      expect(stock_picker([5,8,12,3])).to eq([0,2])
    end

    it 'Highest price on the first day' do
      expect(stock_picker([20,4,6,9])).to eq([1,3])
    end

    it 'biggest (10) and smallest (1) prices are in the wrong order' do
      expect(stock_picker([10,2,8,1,5])).to eq([1,2])
    end
end