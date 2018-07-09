# frozen_string_literal: true

RSpec.describe 'Check for OneFreeRule' do
  let(:factory) { ItemFactory.new }
  let(:market) do
    market = Market.new
    market.add_discount_rule(OneFreeRule.new('FR'))
    market
  end

  it '2 items in checkout' do
    checkout = market.create_checkout
    2.times { checkout.scan(factory.build('FR')).clone }
    expect(checkout.price).to eq(3.11)
  end

  it 'check discount 5 items in checkout/ 3 payed - 2 free' do
    checkout = market.create_checkout
    5.times { checkout.scan(factory.build('FR')).clone }
    expect(checkout.price).to eq(9.33)
  end
end
