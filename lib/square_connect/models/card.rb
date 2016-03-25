=begin
Square Connect API

OpenAPI spec version: 2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git


=end

require 'date'

module SquareConnect
  # Represents a credit card.
  class Card
    # The card's unique ID, if any.
    attr_accessor :id

    # The card's brand (such as `VISA`).
    attr_accessor :card_brand

    # The last 4 digits of the card's number.
    attr_accessor :last_4

    # The month of the card's expiration date, which must be between 1-12.
    attr_accessor :exp_month

    # The year of the card's expiration date, which must be a 4-digit year.
    attr_accessor :exp_year

    # The cardholder name for the card on file.
    attr_accessor :cardholder_name

    # The billing address for the card on file.
    attr_accessor :billing_address

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'id' => :'id',
        
        :'card_brand' => :'card_brand',
        
        :'last_4' => :'last_4',
        
        :'exp_month' => :'exp_month',
        
        :'exp_year' => :'exp_year',
        
        :'cardholder_name' => :'cardholder_name',
        
        :'billing_address' => :'billing_address'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'card_brand' => :'String',
        :'last_4' => :'String',
        :'exp_month' => :'Integer',
        :'exp_year' => :'Integer',
        :'cardholder_name' => :'String',
        :'billing_address' => :'Address'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'card_brand']
        self.card_brand = attributes[:'card_brand']
      end
      
      if attributes[:'last_4']
        self.last_4 = attributes[:'last_4']
      end
      
      if attributes[:'exp_month']
        self.exp_month = attributes[:'exp_month']
      end
      
      if attributes[:'exp_year']
        self.exp_year = attributes[:'exp_year']
      end
      
      if attributes[:'cardholder_name']
        self.cardholder_name = attributes[:'cardholder_name']
      end
      
      if attributes[:'billing_address']
        self.billing_address = attributes[:'billing_address']
      end
      
    end

    # Custom attribute writer method checking allowed values (enum).
    def card_brand=(card_brand)
      allowed_values = ["OTHER_BRAND", "VISA", "MASTERCARD", "AMERICAN_EXPRESS", "DISCOVER", "DISCOVER_DINERS", "JCB", "CHINA_UNIONPAY", "SQUARE_GIFT_CARD"]
      if card_brand && !allowed_values.include?(card_brand)
        fail "invalid value for 'card_brand', must be one of #{allowed_values}"
      end
      @card_brand = card_brand
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          card_brand == o.card_brand &&
          last_4 == o.last_4 &&
          exp_month == o.exp_month &&
          exp_year == o.exp_year &&
          cardholder_name == o.cardholder_name &&
          billing_address == o.billing_address
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [id, card_brand, last_4, exp_month, exp_year, cardholder_name, billing_address].hash
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