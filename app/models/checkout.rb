# frozen_string_literal: true

class Checkout
  attr_reader :items, :total_price

  def initialize(calculator)
    @calculator = calculator
    @items = {}
  end

  def scan(item)
    (@items[item.id] ||= []) << item
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
