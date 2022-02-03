# frozen_string_literal: true

require 'http'
require 'buda/utils'
require 'buda/errors'
require 'buda/constants'
require 'buda/version'
require 'buda/resources/balance'
require 'buda/resources/deposit'
require 'buda/resources/withdrawal'
require 'buda/resources/market'
require 'json'
require 'net/http'
require 'net/https'

module Buda
  # Client component to make the requests and get data
  class Client
    def initialize(api_key, api_secret)
      @api_key = api_key
      @api_secret = api_secret
      @user_agent = "buda-ruby/#{Buda::VERSION}"
      @headers = {
        'Content-Type': 'application/json', 'X-SBTC-APIKEY': @api_key,
        'User-Agent': @user_agent
      }
      @default_params = {}
    end

    def get
      request('get')
    end

    def delete
      request('delete')
    end

    def request(method)
      proc do |resource, is_private, **kwargs|
        parameters = params(method, **kwargs)
        response = make_request(method, resource, parameters, is_private)
        content = JSON.parse(response.body, symbolize_names: true)

        # raise_custom_error(content[:error]) if response.status.client_error? || response.status.server_error?

        content
      end
    end

    def balances
      result = get.call('balances', true)[:balances]
      balances = []
      result&.each do |balance|
        balances << Balance.new(**balance)
      end
      balances
    end

    def get_balance(balance_id)
      result = get.call("balances/#{balance_id}", true)[:balance]
      Balance.new(**result)
    end

    def get_market(market_id)
      market = get.call("markets/#{market_id.upcase}")[:market]
      ticker = get.call("markets/#{market_id.upcase}/ticker")[:ticker]
      new_market = Market.new(**market)
      new_market.set_ticker(**ticker)
      new_market
    end

    def deposits(currency)
      result = get.call("currencies/#{currency}/deposits", true)[:deposits]
      deposits = []
      result&.each do |deposit|
        deposits << Deposit.new(**deposit)
      end
      deposits
    end

    def withdrawals(currency)
      result = get.call("currencies/#{currency}/withdrawals", true)[:withdrawals]
      withdrawals = []
      result&.each do |withdrawal|
        withdrawals << Withdrawal.new(**withdrawal)
      end
      withdrawals
    end

    def to_s
      visible_chars = 4
      hidden_part = '*' * (@api_key.size - visible_chars)
      visible_key = @api_key.slice(0, visible_chars)
      "Client(🔑=#{hidden_part + visible_key}"
    end

    private

    def client
      @client ||= Net::HTTP
    end

    def make_request(method, resource, _parameters, is_private)
      uri = URI.parse("#{Buda::Constants::SCHEME}#{Buda::Constants::BASE_URL}#{resource}")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      if is_private
        req = Net::HTTP::Get.new(uri.path, @headers)
        req['X-SBTC-SIGNATURE'] = sign(method.upcase, uri.path, '')
        req['X-SBTC-NONCE'] = nonce
      else
        req = Net::HTTP::Get.new(uri.path)
      end
      https.request(req)
    end

    def params(method, **kwargs)
      if method == 'get'
        { params: { **@default_params, **kwargs } }
      else
        { json: { **@default_params, **kwargs } }
      end
    end

    def raise_custom_error(error)
      raise error_class(error[:code]).new(error[:message], error[:doc_url])
    end

    def nonce
      (Time.now.to_i * (10**6)).to_s
    end

    def sign(method, path, _body)
      prep = "#{method} #{path} #{nonce}"
      OpenSSL::HMAC.hexdigest('SHA384', @api_secret, prep)
    end
  end
end
