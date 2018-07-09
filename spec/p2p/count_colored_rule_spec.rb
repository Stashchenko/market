# frozen_string_literal: true

RSpec.describe 'Check for CountColoredRule' do
  let(:factory) { ItemFactory.new }
  let(:market) do
    market = Market.new
    market.add_discount_rule(CountColoredRule.new('MS', 10, :white, 1))
    market
  end

  it 'should apply for 10 items in checkout the same white color' do
    expect(create_colored(:white).price).to eq(49.5)
  end

  it 'should not apply for 10 items in random color' do
    checkout = market.create_checkout
    mouse = factory.build('MS')
    10.times do
      mouse.color = %i[white blue].sample
      checkout.scan(mouse.clone)
    end
    expect(checkout.price).to eq(50.0)
  end

  it 'should not apply for 10 items in blue color' do
    expect(create_colored(:blue).price).to eq(50.0)
  end

  private

  def create_colored(color)
    checkout = market.create_checkout
    mouse = factory.build('MS')
    mouse.color = color
    10.times do
      checkout.scan(mouse.clone)
    end
    checkout
  end
end
