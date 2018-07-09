# frozen_string_literal: true

RSpec.describe 'Check for PairRule' do
  let(:factory) { ItemFactory.new }
  let(:market) do
    market = Market.new
    market.add_discount_rule(DiscountForPairRule.new('KB', 'MS', 3))
    market
  end

  it '2 items in checkout' do
    checkout = market.create_checkout
    checkout.scan(factory.build('MS'))
    checkout.scan(factory.build('KB'))
    expect(checkout.price).to eq(14.85)
  end

  it 'check discount for one pair with many products' do
    checkout = market.create_checkout
    checkout.scan(factory.build('MS'))
    checkout.scan(factory.build('KB'))
    checkout.scan(factory.build('MS'))
    checkout.scan(factory.build('MS'))
    checkout.scan(factory.build('MS'))
    expect(checkout.price).to eq(29.85)
  end
end
