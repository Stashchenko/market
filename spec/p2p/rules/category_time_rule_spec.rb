# frozen_string_literal: true

require 'time'

RSpec.describe 'Check for CategoryTimeRule' do
  let(:factory) { ItemFactory.new }
  let(:time_discount) { Time.new(Time.now.year, Time.now.month, Time.now.day, 18, 0o0) }
  let(:market) do
    market = Market.new
    market.add_discount_rule(CategoryTimeRule.new(:food, time_discount, 5))
    market
  end

  it '10 items same category in checkout after evening' do
    allow(Time).to receive(:now).and_return(time_discount)
    checkout = market.create_checkout
    nuts = factory.build('AJ')
    nuts.category = :food
    10.times { checkout.scan(nuts.clone) }
    expect(checkout.price).to eq(57.0)
  end

  it '10 items random category in checkout after evening' do
    allow(Time).to receive(:now).and_return(time_discount)
    checkout = market.create_checkout
    juice = factory.build('AJ')
    juice.category = :food
    mouse = factory.build('MS')
    10.times do
      checkout.scan(juice.clone)
      checkout.scan(mouse.clone)
    end
    expect(checkout.price).to eq(107.0)
  end
end
