# frozen_string_literal: true

require_relative 'base_rule'

class BasePercentageRule < BaseRule
  attr_accessor :percentage

  def initialize(name, percentage)
    @percentage = percentage
    super(name)
  end

  protected

  def percentage_price(price, percentage)
    price - (price * percentage / 100)
  end
end
