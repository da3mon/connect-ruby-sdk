=begin
Square Connect API

OpenAPI spec version: 2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git


=end

# Common files
require 'square_connect/api_client'
require 'square_connect/api_error'
require 'square_connect/version'
require 'square_connect/configuration'

# Models
require 'square_connect/models/card_brand'
require 'square_connect/models/country'
require 'square_connect/models/currency'
require 'square_connect/models/error_category'
require 'square_connect/models/error_code'
require 'square_connect/models/location_capability'
require 'square_connect/models/refund_status'
require 'square_connect/models/sort_order'
require 'square_connect/models/tender_card_details_entry_method'
require 'square_connect/models/tender_card_details_status'
require 'square_connect/models/tender_type'
require 'square_connect/models/transaction_product'
require 'square_connect/models/address'
require 'square_connect/models/capture_transaction_response'
require 'square_connect/models/card'
require 'square_connect/models/charge_request'
require 'square_connect/models/charge_response'
require 'square_connect/models/create_customer_card_request'
require 'square_connect/models/create_customer_card_response'
require 'square_connect/models/create_customer_request'
require 'square_connect/models/create_customer_response'
require 'square_connect/models/create_refund_request'
require 'square_connect/models/create_refund_response'
require 'square_connect/models/customer'
require 'square_connect/models/delete_customer_card_response'
require 'square_connect/models/delete_customer_response'
require 'square_connect/models/error'
require 'square_connect/models/list_customers_request'
require 'square_connect/models/list_customers_response'
require 'square_connect/models/list_locations_response'
require 'square_connect/models/list_refunds_request'
require 'square_connect/models/list_refunds_response'
require 'square_connect/models/list_transactions_request'
require 'square_connect/models/list_transactions_response'
require 'square_connect/models/location'
require 'square_connect/models/money'
require 'square_connect/models/refund'
require 'square_connect/models/retrieve_customer_response'
require 'square_connect/models/retrieve_transaction_response'
require 'square_connect/models/tender'
require 'square_connect/models/tender_card_details'
require 'square_connect/models/tender_cash_details'
require 'square_connect/models/transaction'
require 'square_connect/models/update_customer_request'
require 'square_connect/models/update_customer_response'
require 'square_connect/models/void_transaction_response'

# APIs
require 'square_connect/api/customer_card_api'
require 'square_connect/api/refund_api'
require 'square_connect/api/transaction_api'
require 'square_connect/api/customer_api'
require 'square_connect/api/location_api'

module SquareConnect
  class << self
    # Customize default settings for the SDK using block.
    #   SquareConnect.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end