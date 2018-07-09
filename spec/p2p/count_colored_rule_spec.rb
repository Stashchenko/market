# frozen_string_literal: true

require_relative 'support/shared_examples/colored_rule_example'

RSpec.describe 'Check for CountColoredRule' do
  let(:market) do
    market = Market.new
    market.add_discount_rule(CountColoredRule.new('MS', 10, :white, 1))
    market
  end

  include_examples 'color examples', :white, 49.5
  include_examples 'color examples', :blue, 50.0

  it 'should not apply for 10 items in random color' do
    checkout = market.create_checkout
    mouse = factory.build('MS')
    10.times do
      mouse.color = %i[white blue].sample
      checkout.scan(mouse.clone)
    end
    expect(checkout.price).to eq(50.0)
  end
end
