# frozen_string_literal: true

class Checkout
  attr_accessor :items, :total_price

  def initialize(market)
    @market = market
    @calculator = PriceCalculator.new(market)
    @items = {}
  end

  def scan(item)
    @items[item.id] ||= []
    @items[item.id] << item
  end

  def total
    "Items: #{@items}  Total: $#{price}"
  end

  def price
    # Saving total price for future in details_price method
    @total_price = @calculator.total(@items)
  end

  def details_price
    @total_price ||= @calculator.total(@items)
    @calculator.details_prices
  end
end
