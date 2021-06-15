# typed: true
# frozen_string_literal: true

module SchemaCompliance
  module Fields
    class OptionalField < BaseField
      attr_reader :wrapped

      def initialize(wrapped)
        @wrapped = wrapped
      end

      def validate(field)
        super(field)
        @wrapped.validate(field)
      end

      def expected_type
        ::T.nilable(wrapped.expected_type)
      end

      def humanized_type
        "#{@wrapped.expected_type} or nil"
      end

      def to_swagger
        swagger_field = wrapped.to_swagger
        { optional: true }.merge(swagger_field)
      end
    end
  end
end
