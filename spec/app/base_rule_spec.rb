# frozen_string_literal: true

RSpec.describe BaseRule do
  let(:base_rule) { BaseRule.new('test') }

  it 'should throw exception' do
    expect { base_rule.can_apply?('') }.to raise_error(RuntimeError)
    expect { base_rule.modify_price!('') }.to raise_error(RuntimeError)
  end
end
