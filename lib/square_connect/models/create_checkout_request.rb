=begin
Square Connect API

No descripton provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git


=end

require 'date'

module SquareConnect
  # Defines the parameters that can be included in the body of a request to the [CreateCheckout](#endpoint-createcheckout) endpoint.
  class CreateCheckoutRequest
    # A unique string that identifies this checkout among others you've created. It can be any valid string but must be unique for every order sent to Square Checkout for a given location ID.  The idempotency key is used to avoid processing the same order more than once. If you're unsure whether a particular checkout was created successfully, you can reattempt it with the same idempotency key and all the same other parameters without worrying about creating duplicates.  We recommend using a random number/string generator native to the language you are working in to generate strings for your idempotency keys.  See [Idempotency keys](#idempotencykeys) for more information.
    attr_accessor :idempotency_key

    # The order including line items to be checked out.
    attr_accessor :order

    # If `true`, Square Checkout will collect shipping information on your behalf and store that information with the transaction information in your Square Dashboard.  Default is `false`.
    attr_accessor :ask_for_shipping_address

    # The email address to display on the Square Checkout confirmation page and confirmation email that the buyer can use to contact the merchant.  If this value is not set, the confirmation page and email will display the primary email address associated with the merchant's Square account.  Default is unset.
    attr_accessor :merchant_support_email

    # If provided, the buyer's email is pre-populated on the checkout page as an editable text field.  Default is unset.
    attr_accessor :pre_populate_buyer_email

    # If provided, the buyer's shipping info is pre-populated on the checkout page as editable text fields.  Default is unset.
    attr_accessor :pre_populate_shipping_address

    # The URL to redirect to after checkout is completed with `checkoutId`, Square's `orderId`, `transactionId`, and `referenceId` appended as URL parameters. For example, if the provided redirect_url is `http://www.example.com/order-complete`, a successful transaction redirects the customer to:  `http://www.example.com/order-complete?checkoutId=xxxxxx&orderId=xxxxxx&referenceId=xxxxxx&transactionId=xxxxxx`  If you do not provide a redirect URL, Square Checkout will display an order confirmation page on your behalf; however Square strongly recommends that you provide a redirect URL so you can verify the transaction results and finalize the order through your existing/normal confirmation workflow.  Default is unset.
    attr_accessor :redirect_url

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'idempotency_key' => :'idempotency_key',
        :'order' => :'order',
        :'ask_for_shipping_address' => :'ask_for_shipping_address',
        :'merchant_support_email' => :'merchant_support_email',
        :'pre_populate_buyer_email' => :'pre_populate_buyer_email',
        :'pre_populate_shipping_address' => :'pre_populate_shipping_address',
        :'redirect_url' => :'redirect_url'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'idempotency_key' => :'String',
:'order' => :'CreateOrderRequestOrder',
:'ask_for_shipping_address' => :'BOOLEAN',
:'merchant_support_email' => :'String',
:'pre_populate_buyer_email' => :'String',
:'pre_populate_shipping_address' => :'Address',
:'redirect_url' => :'String'
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      if attributes[:'idempotency_key']
        self.idempotency_key = attributes[:'idempotency_key']
      end
      if attributes[:'order']
        self.order = attributes[:'order']
      end
      if attributes[:'ask_for_shipping_address']
        self.ask_for_shipping_address = attributes[:'ask_for_shipping_address']
      end
      if attributes[:'merchant_support_email']
        self.merchant_support_email = attributes[:'merchant_support_email']
      end
      if attributes[:'pre_populate_buyer_email']
        self.pre_populate_buyer_email = attributes[:'pre_populate_buyer_email']
      end
      if attributes[:'pre_populate_shipping_address']
        self.pre_populate_shipping_address = attributes[:'pre_populate_shipping_address']
      end
      if attributes[:'redirect_url']
        self.redirect_url = attributes[:'redirect_url']
      end
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          idempotency_key == o.idempotency_key &&
          order == o.order &&
          ask_for_shipping_address == o.ask_for_shipping_address &&
          merchant_support_email == o.merchant_support_email &&
          pre_populate_buyer_email == o.pre_populate_buyer_email &&
          pre_populate_shipping_address == o.pre_populate_shipping_address &&
          redirect_url == o.redirect_url
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [idempotency_key, order, ask_for_shipping_address, merchant_support_email, pre_populate_buyer_email, pre_populate_shipping_address, redirect_url].hash
    end

    # build the object from hash
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          else
            #TODO show warning in debug mode
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        else
          # data not found in attributes(hash), not an issue as the data can be optional
        end
      end

      self
    end

    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        _model = SquareConnect.const_get(type).new
        _model.build_from_hash(value)
      end
    end

    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_body (backward compatibility))
    def to_body
      to_hash
    end

    # return the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Method to output non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end