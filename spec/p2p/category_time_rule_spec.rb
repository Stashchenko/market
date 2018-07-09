# frozen_string_literal: true

require 'time'

RSpec.describe 'Check for CategoryTimeRule' do
  let(:factory) {ItemFactory.new}
  let(:time_discount) {Time.new(Time.now.year, Time.now.month, Time.now.day, 18, 0o0)}
  let(:mouse) {factory.build('MS')}

  let(:food_item) do
    item = factory.build('AJ')
    item.category = :food
    item
  end

  let(:market) do
    market = Market.new
    market.add_discount_rule(CategoryTimeRule.new(:food, time_discount, 5))
    market
  end


  before do
    allow(Time).to receive(:now).and_return(time_discount)
  end

  it '10 items same category in checkout after evening' do
    checkout = market.create_checkout
    10.times {checkout.scan(food_item.clone)}
    expect(checkout.price).to eq(57.0)
  end

  it '10 items random category in checkout after evening' do
    checkout = market.create_checkout
    10.times do
      checkout.scan(food_item.clone)
      checkout.scan(mouse.clone)
    end
    expect(checkout.price).to eq(107.0)
  end
end
