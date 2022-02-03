# frozen_string_literal: true

require 'buda/resources/withdrawal_data'

module Buda
  # for handling the total balance
  class Withdrawal
    attr_reader :id, :created_at, :amount, :currency,
                :fee, :state, :deposit_data, :account_id,
                :user_id, :order_id, :order_type, :state_reason,
                :expected_arrival_time, :reserve_name, :reserve_code

    def initialize(**kwargs)
      @id = kwargs[:id]
      @uuid = kwargs[:uuid]
      @currency = kwargs[:currency]
      @created_at = kwargs[:created_at]
      @forced_reason = kwargs[:forced_reason]
      @account_id = kwargs[:account_id]
      @user_id = kwargs[:user_id]
      @expected_execution_time = kwargs[:expected_execution_time]
      @expected_arrival_time = kwargs[:expected_arrival_time]
      @hold_execution = kwargs[:hold_execution]
      @amount = kwargs[:amount][0]
      @fee = kwargs[:fee]
      @usd_amount = kwargs[:usd_amount]
      @deposit_data = WithdrawalData.new(**kwargs[:withdrawal_data])
    end

    def to_s
      "#{@amount} (#{@currency})"
    end

    def inspect
      "<Withdrawal #{@amount} (#{@currency})>"
    end
  end
end
