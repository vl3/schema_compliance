# frozen_string_literal: true

module SchemaCompliance
  module Fields
    class IntegerField < BaseField
      def expected_type
        Integer
      end

      def to_swagger
        { type: :integer }
      end
    end
  end
end
