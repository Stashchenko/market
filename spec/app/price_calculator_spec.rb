# frozen_string_literal: true

RSpec.describe PriceCalculator do
  let(:item) { Item.new('FR', 'Fruit Tea', 3.11) }
  let(:discount_rules) { [OneFreeRule.new('FR')] }
  # before do
  #   allow(market).to receive(:discount_rules).and_return([OneFreeRule.new('FR')])
  # end

  it 'sums the prices of the one item' do
    price_calculator = PriceCalculator.new(discount_rules)
    expect(price_calculator.total('FR': [item])).to eq(3.11)
  end

  it 'sums the prices of the two items' do
    price_calculator = PriceCalculator.new(discount_rules)
    expect(price_calculator.total("FR": [item, item])).to eq(6.22)
  end

  it 'sums the prices of with OneFreeRule discount' do
    price_calculator = PriceCalculator.new(discount_rules)
    expect(price_calculator.total('FR' => [item, item.clone])).to eq(3.11)
  end
end
