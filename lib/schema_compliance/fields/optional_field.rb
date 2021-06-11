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

      def validation_error_message(field)
        "Expected #{@wrapped.expected_type} or nil, got #{field.class} with value #{field}"
      end

      def to_swagger
        { optional: true }
      end
    end
  end
end
