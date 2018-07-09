# frozen_string_literal: true

# One product in pair costs = 0
class OneFreeRule < BaseRule
  def can_apply?(items)
    return false if items[item_name].nil?
    items[item_name].count > 1
  end

  def modify_price!(items)
    items[item_name].each_with_index do |item, index|
      if double_item?(index)
        item.price = 0.00
        item.add_discount_rules(self.class)
      end
    end
  end

  private

  def double_item?(index)
    (index + 1).even?
  end
end
