# frozen_string_literal: true

module SchemaCompliance
  module Fields
    class StringField < BaseField
      def expected_type
        String
      end

      def validation_error_message(field)
        "Expected String, got #{field.class} with value #{field}"
      end

      def to_swagger
        { type: :string }
      end
    end
  end
end
