# frozen_string_literal: true

module Buda
  # for handling the total balance
  class Balance
    attr_reader :id, :available, :current, :frozen, :pending

    def initialize(id:, available_amount:, amount:, frozen_amount:, pending_withdraw_amount:, **)
      @id = id
      @available = available_amount[0]
      @current = amount[0]
      @frozen = frozen_amount[0]
      @pending = pending_withdraw_amount[0]
    end

    def to_s
      "#{id}: #{@current} (#{@available})"
    end

    def inspect
      "<Balance #{@current} (#{@available})>"
    end
  end
end
