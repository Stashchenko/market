# frozen_string_literal: true

# Apply one price for all same products
# For example if you buy more than 5 keyboards each price set 9.99 not old (10.55)
class MoreThanRule < BaseRule
  attr_accessor :items_count, :price

  def initialize(item_name, count, price)
    @items_count = count
    @price = price
    super(item_name)
  end

  def can_apply?(items)
    return false if items[@item_name].nil?
    items[@item_name].count >= @items_count
  end

  def modify_price!(items)
    items[@item_name].each do |item|
      item.price = @price
      item.add_discount_rules(self.class)
    end
  end
end
