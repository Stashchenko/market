# frozen_string_literal: true

class DiscountForPairRule < BasePercentageRule
  attr_accessor :first_item, :second_item

  def initialize(first_item, second_item, percentage)
    @first_item = first_item
    @second_item = second_item
    super("#{first_item}_#{second_item}", percentage)
  end

  def can_apply?(items)
    !items[@first_item].nil? && !item_name[@second_item].nil?
  end

  def modify_price!(items)
    total_first_product = items[@first_item].count
    items.values.flatten.each_with_index do |item, index|
      break if index >= total_first_product
      item.price = percentage_price(item.price, percentage)
      item.add_discount_rules(self.class)
    end
  end
end
