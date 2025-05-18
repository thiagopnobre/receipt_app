# frozen_string_literal: true

require './lib/models/item'

RSpec.describe Lib::Models::Item do
  describe '#initialize' do
    it 'initializes an item with no tax if it is exempt and not imported' do
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
      expect(item.tax).to eq 0.0
    end

    it 'initializes an item with import duty tax if it is exempt and imported' do
      item = described_class.new(
        quantity: 2,
        product: 'book',
        amount: 12.49,
        category: 'food',
        imported: true
      )

      expect(item.quantity).to eq 2
      expect(item.product).to eq 'book'
      expect(item.amount).to eq 12.49
      expect(item.category).to eq 'food'
      expect(item.imported).to be true
      expect(item.tax).to eq described_class::IMPORT_DUTY
    end

    it 'initializes an item with basic sales tax if it is not exempt and not imported' do
      item = described_class.new(
        quantity: 2,
        product: 'book',
        amount: 12.49,
        category: 'other',
        imported: false
      )

      expect(item.quantity).to eq 2
      expect(item.product).to eq 'book'
      expect(item.amount).to eq 12.49
      expect(item.category).to eq 'other'
      expect(item.imported).to be false
      expect(item.tax).to eq described_class::BASIC_SALES_TAX
    end

    it 'initializes an item with basic sales plus import duty taxes if it is not exempt and ' \
       'it is imported' do
      item = described_class.new(
        quantity: 2,
        product: 'book',
        amount: 12.49,
        category: 'other',
        imported: true
      )

      expect(item.quantity).to eq 2
      expect(item.product).to eq 'book'
      expect(item.amount).to eq 12.49
      expect(item.category).to eq 'other'
      expect(item.imported).to be true
      expect(item.tax).to eq described_class::BASIC_SALES_TAX + described_class::IMPORT_DUTY
    end
  end
end
