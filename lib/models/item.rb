# frozen_string_literal: true

module Lib
  module Models
    class Item
      attr_reader :quantity, :product, :amount, :tax, :category, :imported

      EXEMPT_CATEGORIES = %w[books food medical].freeze
      BASIC_SALES_TAX = 0.1
      IMPORT_DUTY = 0.05

      def initialize(quantity:, product:, amount:, category:, imported:)
        @quantity = quantity
        @product = product
        @amount = amount
        @category = category
        @imported = imported
        calculate_tax
      end

      private

      def calculate_tax
        @tax = 0.0
        @tax += BASIC_SALES_TAX unless EXEMPT_CATEGORIES.include?(@category)
        @tax += IMPORT_DUTY if @imported
      end
    end
  end
end
