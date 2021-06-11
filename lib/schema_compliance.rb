# frozen_string_literal: true

require_relative "schema_compliance/version"
require_relative "schema_compliance/fields"

require "sorbet-runtime"

def Optional(wrapped_class)
  SchemaCompliance::Fields::OptionalField.new(wrapped_class)
end

IntegerField = SchemaCompliance::Fields::IntegerField
StringField = SchemaCompliance::Fields::StringField
Schema = SchemaCompliance::Fields::Schema

module SchemaCompliance
  extend T::Sig

  class Error < StandardError; end

  Result = Struct.new(:valid?, :errors)
end
