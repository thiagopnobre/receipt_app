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
        @sales_taxes = items.sum do |item|
          round_to_the_nearest(item.quantity * item.amount * item.tax)
        end.round(2)
      end

      def calculate_total
        @total = items.sum do |item|
          round_to_the_nearest(item.quantity * item.amount * (1 + item.tax))
        end.round(2)
      end

      def round_to_the_nearest(value) = (value * 20.0).round / 20.0
    end
  end
end
