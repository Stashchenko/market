# frozen_string_literal: true

RSpec.describe 'Check for MoreThanRule' do
  let(:factory) { ItemFactory.new }
  let(:market) do
    market = Market.new
    market.add_discount_rule(MoreThanRule.new('KB', 5, 9.00))
    market
  end

  it 'should add discount for 5 items' do
    checkout = market.create_checkout
    5.times { checkout.scan(factory.build('KB').clone) }
    expect(checkout.price).to eq(45.0)
  end

  it 'should add discount only for 5 Keyboards' do
    checkout = market.create_checkout
    5.times { checkout.scan(factory.build('KB').clone) }
    5.times { checkout.scan(factory.build('MS').clone) }
    expect(checkout.price).to eq(70.0)
  end

  it 'should not add discount for 4 items' do
    checkout = market.create_checkout
    4.times { checkout.scan(factory.build('KB').clone) }
    expect(checkout.price).to eq(40.0)
  end
end
