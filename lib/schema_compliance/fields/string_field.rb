# typed: true
# frozen_string_literal: true

module SchemaCompliance
  module Fields
    class StringField < BaseField
      def expected_type
        String
      end

      def to_swagger
        { type: :string }
      end
    end
  end
end
