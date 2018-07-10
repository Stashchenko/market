# frozen_string_literal: true

class PriceCalculator
  attr_reader :details_prices

  def initialize(market)
    @market = market
  end

  def total(items)
    @details_prices = items # save details_prices for future details
    @market.apply_rules!(items)
    @details_prices.values.flatten.sum(&:price).round(2)
  end
end
