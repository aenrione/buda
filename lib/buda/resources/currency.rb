# frozen_string_literal: true

module Buda
  # Client component to make the requests and get data
  class Client
    attr_reader :id, :amount

    def initialize(id, amount)
      @id = id
      @amount = amount
    end

    def to_s
      "#{@amount} (#{@id})"
    end

    def inspect
      "<Currency #{@amount} (#{@id})>"
    end
  end
end
