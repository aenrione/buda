# frozen_string_literal: true

module Buda
  # for handling the total balance
  class FiatAccount
    attr_reader :id, :account_number, :created_at, :account_type,
                :currency

    def initialize(**kwargs)
      @id = kwargs[:id]
      @account_number = kwargs[:account_number]
      @created_at = kwargs[:created_at]
      @account_type = kwargs[:account_type]
      @bank_id = kwargs[:bank_id]
      @currency = kwargs[:currency]
      @document_number = kwargs[:document_number]
      @email = kwargs[:email]
      @phone = kwargs[:phone]
      @national_number_identifier = kwargs[:national_number_identifier]
      @bank_name = kwargs[:bank_name]
      @updated_at = kwargs[:updated_at]
      @inter_bank_number = kwargs[:inter_bank_number]
      @source_account = kwargs[:source_account]
    end

    def to_s
      "#{@bank_name} (#{@account_number})"
    end

    def inspect
      "<FiatAccount #{@bank_name} (#{@account_number})>"
    end
  end
end
