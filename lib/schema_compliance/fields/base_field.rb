# typed: ignore
# frozen_string_literal: true
require "sorbet-runtime"

module SchemaCompliance
  module Fields
    class BaseField
      extend ::T::Sig

      attr_reader :field, :error

      sig {returns(T.class_of(Object))}
      def expected_type
        Object
      end

      sig {returns(String)}
      def humanized_type
        expected_type.to_s
      end

      sig {params(field: T.class_of(Object)).returns(Result)}
      def validate(field)
        error = nil
        begin
          ::T.let(field, expected_type)
        rescue TypeError
          error = validation_error_message(field)
        end
        Result.new(error.nil?, [error])
      end

      sig {params(field: T.class_of(Object)).returns(String)}
      def validation_error_message(field)
        "Expected #{humanized_type}, got #{field.class} with value #{field}"
      end

      sig { returns(Hash) }
      def to_swagger
        { type: :object }
      end
    end
  end
end
