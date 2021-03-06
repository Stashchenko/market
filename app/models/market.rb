# frozen_string_literal: true

class Market
  attr_accessor :products

  def add_discount_rule(rule)
    (@discount_rules ||= {})[rule.item_name] = rule
  end

  def discount_rules
    @discount_rules.values
  end

  def create_checkout
    calc = PriceCalculator.new(discount_rules)
    Checkout.new(calc)
  end
end
