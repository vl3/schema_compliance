# typed: true
# frozen_string_literal: true

module SchemaCompliance
  module Fields
    class ArrayField < BaseField
      sig { returns(T.class_of(Array)) }
      def expected_type
        Array
      end

      sig { returns(Hash) }
      def to_swagger
        { type: :array }
      end
    end
  end
end
