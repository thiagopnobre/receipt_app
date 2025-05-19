# frozen_string_literal: true

require 'pry'
require './lib/parsers/item_parser'
require './lib/models/item'
require './lib/models/receipt'

class App
  def run # rubocop:disable Metrics/AbcSize
    files = Dir.entries("#{__dir__}/baskets") - ['.', '..']
    files.each_with_index do |file_name, index|
      File.open("#{__dir__}/baskets/#{file_name}") do |file|
        puts "Input #{index + 1}:"

        items = []
        file.each do |line|
          parsed_line = Lib::Parsers::ItemParser.new.parse(item_str: line)
          items << Lib::Models::Item.new(**parsed_line)
        end

        puts Lib::Models::Receipt.new(items:)
        puts '-' * 80
      end
    end
  end
end

App.new.run
