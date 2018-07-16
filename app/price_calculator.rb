# frozen_string_literal: true

class PriceCalculator
  attr_reader :details_prices

  def initialize(discount_rules)
    @discount_rules = discount_rules
  end

  def total(items)
    @details_prices = items # save details_prices for future details
    apply_rules!(items)
    @details_prices.values.flatten.sum(&:price).round(2)
  end

  def apply_rules!(items)
    @discount_rules.each do |rule|
      rule.modify_price!(items) if rule.can_apply?(items)
    end
  end
end
