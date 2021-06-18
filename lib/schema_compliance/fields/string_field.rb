# typed: true
# frozen_string_literal: true
require "sorbet-runtime"

module SchemaCompliance
  module Fields
    class StringField < BaseField
      sig { returns(T.class_of(String)) }
      def expected_type
        String
      end

      sig { returns(Hash) }
      def to_swagger
        { type: :string }
      end
    end
  end
end
