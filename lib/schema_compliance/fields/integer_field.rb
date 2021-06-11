# frozen_string_literal: true

module SchemaCompliance
  module Fields
    class IntegerField < BaseField
      def expected_type
        Integer
      end

      def validation_error_message(field)
        "Expected Integer, got #{field.class} with value #{field}"
      end

      def to_swagger
        { type: :integer }
      end
    end
  end
end
