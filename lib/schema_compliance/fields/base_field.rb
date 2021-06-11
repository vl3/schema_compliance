module SchemaCompliance
  module Fields
    class BaseField
      attr_reader :field, :error

      def expected_type
        Object
      end

      def validate(field)
        error = nil
        begin
          ::T.let(field, expected_type)
        rescue TypeError
          error = validation_error_message(field)
        end
        Result.new(error.nil?, [error])
      end

      def validation_error_message(field)
        "Expected Object, got #{field.class} with value #{field}"
      end
    end
  end
end
