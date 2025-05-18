# frozen_string_literal: true

require './lib/parsers/item_parser'

RSpec.describe Lib::Parsers::ItemParser do
  describe '#initialize' do
    context 'when the item string is invalid' do
      it 'raises an error' do
        expect {
          described_class.new.parse(item_str: 'invalid')
        }.to raise_error(Lib::Parsers::ItemParseError, /Invalid item string: invalid/)
      end
    end

    context 'when the product is not imported' do
      it 'returns the parsed result' do
        result = described_class.new.parse(item_str: '2 book at 12.49')
        expected_result = {
          quantity: 2,
          product: 'book',
          amount: 12.49,
          category: 'other',
          imported: false
        }

        expect(result).to eq expected_result
      end
    end

    context 'when the product is imported' do
      it 'returns the parsed result' do
        result = described_class.new.parse(item_str: '1 imported box of chocolates at 10.00')
        expected_result = {
          quantity: 1,
          product: 'imported box of chocolates',
          amount: 10.00,
          category: 'other',
          imported: true
        }

        expect(result).to eq expected_result
      end
    end
  end
end
