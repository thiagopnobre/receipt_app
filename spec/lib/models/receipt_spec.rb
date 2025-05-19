# frozen_string_literal: true

require './lib/models/item'
require './lib/models/receipt'

RSpec.describe Lib::Models::Receipt do
  let(:item_1) do
    Lib::Models::Item.new(
      quantity: 2,
      product: 'book',
      amount: 12.49,
      category: 'books',
      imported: false
    )
  end

  let(:item_2) do
    Lib::Models::Item.new(
      quantity: 1,
      product: 'music CD',
      amount: 14.99,
      category: 'other',
      imported: false
    )
  end

  let(:item_3) do
    Lib::Models::Item.new(
      quantity: 1,
      product: 'chocolate bar',
      amount: 0.85,
      category: 'food',
      imported: false
    )
  end

  let(:item_4) do
    Lib::Models::Item.new(
      quantity: 1,
      product: 'imported box of chocolates',
      amount: 10.00,
      category: 'food',
      imported: true
    )
  end

  let(:item_5) do
    Lib::Models::Item.new(
      quantity: 1,
      product: 'imported bottle of perfume',
      amount: 47.50,
      category: 'other',
      imported: true
    )
  end

  describe '#initialize' do
    it 'initializes with the right sales_taxes and the right total for the given items' do
      receipt = described_class.new(items: [item_1, item_2, item_3, item_4, item_5])

      expect(receipt.sales_taxes).to eq 9.15
      expect(receipt.total).to eq 107.47
    end
  end

  describe '#to_s' do
    it 'returns the receipt string' do
      receipt = described_class.new(items: [item_1, item_2, item_3])
      expect(receipt.to_s).to eq "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\n" \
                                 "Sales Taxes: 1.50\nTotal: 42.32"
    end
  end
end
