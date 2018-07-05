# frozen_string_literal: true

class OneFreeRule < BaseRule
  def can_apply?(items)
    return false if items[@item_name].nil?
    items[@item_name].count > 1
  end

  def modify_price!(items)
    items[@item_name].each_with_index do |_price, index|
      if double_item?(index)
        items[@item_name][index].price = 0.00
        items[@item_name][index].add_discount_rules(self.class)
      end
    end
  end

  private

  def double_item?(index)
    (index + 1).even?
  end
end
