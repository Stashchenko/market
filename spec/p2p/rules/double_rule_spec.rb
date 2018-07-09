# frozen_string_literal: true

RSpec.describe 'Check for DoubleRule' do
  let(:factory) { ItemFactory.new }
  let(:market) do
    market = Market.new
    market.add_discount_rule(DoubleRule.new('BR', 'NT'))
    market
  end

  it '2 items in checkout' do
    checkout = market.create_checkout
    checkout.scan(factory.build('BR'))
    checkout.scan(factory.build('NT'))
    expect(checkout.price).to eq(5.9)
    expect(checkout.details_price['NT'].first.discount_rules.first).to eq(DoubleRule)
  end

  it 'check discount 1 Bear and many nuts items in checkout' do
    checkout = market.create_checkout
    checkout.scan(factory.build('BR'))
    checkout.scan(factory.build('NT'))
    checkout.scan(factory.build('NT'))
    checkout.scan(factory.build('NT'))
    expect(checkout.price).to eq(10.1)
  end
end
