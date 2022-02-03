# frozen_string_literal: true

require 'buda/resources/fiat_account'

module Buda
  # for handling the total balance
  class WithdrawalData
    attr_reader :type, :id, :created_at, :update_at,
                :tx_hash, :target_address, :statement_ref,
                :fiat_account

    def initialize(**kwargs)
      @type = kwargs[:type]
      @id = kwargs[:id]
      @statement_ref = kwargs[:statement_ref]
      @created_at = kwargs[:created_at]
      @updated_at = kwargs[:updated_at]
      @target_address = kwargs[:target_address]
      @tx_hash = kwargs[:tx_hash]
      @fiat_account = FiatAccount.new(**kwargs[:fiat_account]) if kwargs[:fiat_account]
    end

    def to_s
      "#{@type} (#{@created_at})"
    end

    def inspect
      "<WithdrawalData #{@type} (#{@created_at})>"
    end
  end
end
