# frozen_string_literal: true

require_relative 'ticker'

module Buda
  # for handling the total balance
  class Market
    attr_reader :id, :name, :base_currency, :quote_currency, :minimum_order_amount, :ticker

    def initialize(id:, name:, base_currency:, quote_currency:, minimum_order_amount:, **)
      @id = id
      @name = name
      @base_currency = base_currency
      @quote_currency = quote_currency
      @minimum_order_amount = minimum_order_amount
    end

    def set_ticker(**ticker)
      @ticker = Buda::Ticker.new(**ticker)
    end

    def to_s
      "#{@name} (#{@id})"
    end

    def inspect
      "<Market #{@name} (#{@id})>"
    end
  end
end
