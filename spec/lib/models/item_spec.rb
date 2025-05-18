# frozen_string_literal: true

require './lib/models/item'

RSpec.describe Lib::Models::Item do
  describe '#initialize' do
    it 'initializes an item' do
      item = described_class.new(
        quantity: 2,
        product: 'book',
        amount: 12.49,
        category: 'food',
        imported: false
      )

      expect(item.quantity).to eq 2
      expect(item.product).to eq 'book'
      expect(item.amount).to eq 12.49
      expect(item.category).to eq 'food'
      expect(item.imported).to be false
      expect(item.tax).to eq(0.0)
    end
  end
end
