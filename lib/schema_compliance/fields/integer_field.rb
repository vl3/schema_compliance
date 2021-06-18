# typed: true
# frozen_string_literal: true

require "sorbet-runtime"

module SchemaCompliance
  module Fields
    class IntegerField < BaseField
      sig { returns(T.class_of(Integer)) }
      def expected_type
        Integer
      end

      sig { returns(Hash) }
      def to_swagger
        { type: :integer }
      end
    end
  end
end
