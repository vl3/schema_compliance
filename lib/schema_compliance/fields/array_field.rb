# frozen_string_literal: true

module SchemaCompliance
  module Fields
    class ArrayField < BaseField
      def expected_type
        Array
      end

      def to_swagger
        { type: :array }
      end
    end
  end
end
