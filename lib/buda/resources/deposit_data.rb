# frozen_string_literal: true

module Buda
  # for handling deposit_data of Deposit Class
  class DepositData
    attr_reader :type, :upload_url, :created_at, :update_at,
                :tx_hash, :address, :method

    def initialize(
      type:, upload_url:, created_at:,
      updated_at:, **kwargs
    )
      @type = type
      @upload_url = upload_url
      @created_at = created_at
      @updated_at = updated_at
      @method = kwargs[:method]
      @address = kwargs[:address]
      @tx_hash = kwargs[:tx_hash]
    end

    def to_s
      "#{@type} (#{@created_at.to_date})"
    end

    def inspect
      "<DepositData #{@type} (#{@created_at.to_date})>"
    end
  end
end
