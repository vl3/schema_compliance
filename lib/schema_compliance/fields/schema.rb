# frozen_string_literal: true

module SchemaCompliance
  module Fields
    class Schema < BaseField
      attr_reader :fields

      def initialize
        @fields = {}
        attributes
      end

      def attribute(field_name, type)
        @fields[field_name] = type
      end

      def validate(hash)
        errors = {}
        @fields.each do |field_name, type|
          provided_field = hash.fetch(field_name)
          result = type.validate(provided_field)
          errors[field_name] = result.errors unless result.valid?
        end
        Result.new(errors.empty?, errors)
      end

      def expected_type
        Hash
      end

      def humanized_type
        "Hash"
      end

      def to_swagger
        base = { type: :object, properties: {} }
        @fields.each do |field_name, type|
          base[:properties][field_name] = type.to_swagger
        end
        base
      end
    end
  end
end
