# frozen_string_literal: true

RSpec.shared_examples 'color examples' do |color, price|
  let(:factory) { ItemFactory.new }

  it 'should check price bu colored items' do
    checkout = market.create_checkout
    mouse = factory.build('MS')
    mouse.color = color
    10.times do
      checkout.scan(mouse.clone)
    end
    expect(checkout.price).to eq(price)
  end
end
