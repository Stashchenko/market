# frozen_string_literal: true

class CategoryTimeRule < BaseRule
  attr_accessor :category, :time, :percentage

  def initialize(category, time, percentage)
    @time = time
    @category = category
    @percentage = percentage
  end

  def can_apply?(items)
    items_present = items.values.flatten.count {|item| item.category == @category}.positive?
    items_present && Time.now >= @time
  end

  def modify_price!(items)
    by_category = items.values.flatten.select {|item| item.category == @category}
    by_category.each do |item|
      item.price = percentage_price(item.price, @percentage)
      item.add_discount_rules(self.class)
    end
  end
end
