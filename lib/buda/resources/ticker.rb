# frozen_string_literal: true

module Buda
  # for handling the total balance
  class Ticker
    attr_reader :market_id, :last_price, :min_ask, :volume,
                :max_bid, :price_variation_7d, :price_variation_24h

    def initialize(market_id:,
                   last_price:, min_ask:,
                   max_bid:, volume:,
                   price_variation_24h:, price_variation_7d:, **)
      @market_id = market_id
      @last_price = last_price[0]
      @min_ask = min_ask
      @max_bid = max_bid
      @price_variation_24h = price_variation_24h
      @volume = volume
      @price_variation_7d = price_variation_7d
    end

    def to_s
      "#{@market_id} (#{@last_price})"
    end

    def inspect
      "<Ticker #{@market_id} (#{@last_price})>"
    end
  end
end
