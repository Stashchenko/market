# frozen_string_literal: true

class CountColoredRule < BasePercentageRule
  attr_accessor :count, :color

  def initialize(item_name, count, color, percentage)
    @count = count
    @color = color
    super(item_name, percentage)
  end

  def can_apply?(items)
    count_colored = items.values.flatten.count { |k| k.color == color }
    count_colored >= count
  end

  def modify_price!(items)
    items.values.flatten.each do |item|
      item.price = percentage_price(item.price, percentage)
      item.add_discount_rules(self.class)
    end
  end
end
