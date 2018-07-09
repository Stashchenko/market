# frozen_string_literal: true

class Item
  attr_reader :id, :name, :discount_rules
  attr_accessor :price, :color, :category

  def initialize(id, name, price)
    @id = id
    @name = name
    @price = price
    @color = :none
    @category = :none
  end

  def add_discount_rules(rule_name)
    @discount_rules ||= []
    @discount_rules << rule_name
  end

  def inspect
    result = "#{id}: $#{price}"
    result += ", discounts: #{discount_rules}" if discount_rules
    result
  end
end
