# frozen_string_literal: true

module Lib
  module Models
    class Receipt
      attr_reader :items, :sales_taxes, :total

      def initialize(items: [])
        @items = items
        calculate_sales_taxes
        calculate_total
      end

      private

      def calculate_sales_taxes
        @sales_taxes = items.sum { |item| (item.quantity * item.amount * item.tax).round(2) }
        @sales_taxes = @sales_taxes.round(2)
      end

      def calculate_total
        @total = items.sum { |item| (item.quantity * item.amount * (1 + item.tax)).round(2) }
        @total = @total.round(2)
      end
    end
  end
end
