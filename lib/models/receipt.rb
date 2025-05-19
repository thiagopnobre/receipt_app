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

      def to_s
        receipt_str = []

        @items.each do |item|
          receipt_str << "#{item.quantity} #{item.product}: #{format('%.2f', item_total(item))}\n"
        end

        receipt_str << "Sales Taxes: #{format('%.2f', @sales_taxes)}\n"

        receipt_str << "Total: #{format('%.2f', @total)}"

        receipt_str.join
      end

      private

      def calculate_sales_taxes = @sales_taxes = items.sum { |item| item_taxes(item) }.round(2)

      def calculate_total = @total = items.sum { |item| item_total(item) }.round(2)

      def item_taxes(item) = round_to_the_nearest(item.quantity * item.amount * item.tax)

      def item_total(item) = (item.quantity * item.amount) + round_to_the_nearest(item_taxes(item))

      def round_to_the_nearest(value) = (value * 20.0).round / 20.0
    end
  end
end
