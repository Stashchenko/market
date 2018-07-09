# frozen_string_literal: true

class BaseRule
  attr_accessor :item_name

  def initialize(name)
    @item_name = name
  end

  def can_apply?(_items)
    raise 'Should be implement'
  end

  def modify_price!(_items)
    raise 'Should be implement'
  end

  protected

  def percentage_price(price, percentage)
    price - (price * percentage / 100)
  end
end
