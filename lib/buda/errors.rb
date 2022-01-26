# frozen_string_literal: true

require 'buda/constants'

module Buda
  module Errors
    # Error definitions for handling wrong requests
    class BudaError < StandardError
      def initialize(message, doc_url = Buda::Constants::GENERAL_DOC_URL)
        super()
        @message = message
        @doc_url = doc_url
      end

      def message
        "\n#{@message}\n Please check the docs at: #{@doc_url}"
      end

      def to_s
        message
      end
    end

    class InvalidRequestError < BudaError; end
    class LinkError < BudaError; end
    class AuthenticationError < BudaError; end
    class InstitutionError < BudaError; end
    class ApiError < BudaError; end
    class MissingResourceError < BudaError; end
    class InvalidLinkTokenError < BudaError; end
    class InvalidUsernameError < BudaError; end
    class InvalidHolderTypeError < BudaError; end
    class MissingParameterError < BudaError; end
    class EmptyStringError < BudaError; end
    class UnrecognizedRequestError < BudaError; end
    class InvalidDateError < BudaError; end
    class InvalidCredentialsError < BudaError; end
    class LockedCredentialsError < BudaError; end
    class InvalidApiKeyError < BudaError; end
    class UnavailableInstitutionError < BudaError; end
    class InternalServerError < BudaError; end
  end
end
