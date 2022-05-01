# frozen_string_literal: true

require_relative 'deposit_data'

module Buda
  # for handling deposited amount
  class Deposit
    attr_reader :id, :created_at, :amount, :currency,
                :fee, :state, :deposit_data, :account_id,
                :user_id, :order_id, :order_type, :state_reason,
                :expected_arrival_time, :reserve_name, :reserve_code

    def initialize(
      id:, created_at:, amount:, currency:,
      fee:, state:, account_id:, user_id:,
      order_id:, order_type:, state_reason:,
      expected_arrival_time:, reserve_name:, reserve_code:,
      deposit_data:, **
    )
      @id = id
      @created_at = created_at
      @amount = amount[0]
      @currency = currency
      @fee = fee
      @state = state
      @account_id = account_id
      @user_id = user_id
      @order_id = order_id
      @order_type = order_type
      @state_reason = state_reason
      @expected_arrival_time = expected_arrival_time
      @reserve_name = reserve_name
      @reserve_code = reserve_code
      @deposit_data = DepositData.new(**deposit_data)
    end

    def to_s
      "#{@amount} (#{@currency})"
    end

    def inspect
      "<Deposit #{@amount} (#{@currency})>"
    end
  end
end
