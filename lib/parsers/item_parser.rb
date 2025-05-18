# frozen_string_literal: true

module Lib
  module Parsers
    class ItemParseError < StandardError
    end

    class ItemParser
      def parse(item_str:)
        result = item_str.match(/^(\d+) (.*?) at (\d+\.\d{2})$/)

        raise ItemParseError, "Invalid item string: #{item_str}" if result.nil?

        {
          quantity: result[1].to_i,
          product: result[2],
          amount: result[3].to_f,
          category: category(result[2]),
          imported: imported?(result[2])
        }
      end

      private

      def category(_product) = 'other'

      def imported?(product) = product.include?('imported')
    end
  end
end
