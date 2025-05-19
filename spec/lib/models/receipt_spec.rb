# frozen_string_literal: true

require 'pry'
require './lib/models/item'
require './lib/models/receipt'

RSpec.describe Lib::Models::Receipt do
  describe '#initialize' do
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

    let(:items) { [item_1, item_2, item_3, item_4, item_5] }

    it 'initializes with the right sales_taxes and the right total for the given items' do
      receipt = described_class.new(items:)

      expect(receipt.sales_taxes).to eq 9.15
      expect(receipt.total).to eq 107.45
    end
  end
end
