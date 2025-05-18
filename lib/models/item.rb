# frozen_string_literal: true

module Lib
  module Models
    class Item
      attr_reader :quantity, :product, :amount, :tax, :category, :imported

      def initialize(quantity:, product:, amount:, category:, imported:)
        @quantity = quantity
        @product = product
        @amount = amount
        @tax = 0.0
        @category = category
        @imported = imported
      end
    end
  end
end
