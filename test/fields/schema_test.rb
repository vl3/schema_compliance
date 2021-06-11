# frozen_string_literal: true

require "test_helper"

class MoneySchema < Schema
  def attributes
    attribute :value,    IntegerField.new
    attribute :currency, StringField.new
  end
end

class ProductSchema < Schema
  def attributes
    attribute :tax,          Optional(MoneySchema.new)
    attribute :name,         StringField.new
    attribute :price,        MoneySchema.new
    attribute :description,  Optional(StringField.new)
    attribute :times_bought, IntegerField.new
  end
end

class SchemaTest < Minitest::Test
  def setup
    @schema = ProductSchema.new
  end

  def test_that_its_valid
    assert_equal(
      SchemaCompliance::Result.new(true, []).valid?,
      @schema.validate(
        {
          name: 'Amazing product!',
          tax: { value: 10, currency: 'USD' },
          price: { value: 100, currency: 'USD' },
          description: 'Long description',
          times_bought: 20
        }
      ).valid?
    )
  end

  def test_invalid_string_field
    assert_equal(
      SchemaCompliance::Result.new(false, name: "Expected String, got #{1.class} with value 1").valid?,
      @schema.validate(
        {
          name: 1,
          tax: { value: 10, currency: 'USD' },
          price: { value: 100, currency: 'USD' },
          description: 'Long description',
          times_bought: 20
        }
      ).valid?
    )
  end

  def test_invalid_integer_field
    assert_equal(
      SchemaCompliance::Result.new(false, times_bought: "Expected Integer, got String with value 20").valid?,
      @schema.validate(
        {
          name: 'Amazing product!',
          tax: { value: 10, currency: 'USD' },
          price: { value: 100, currency: 'USD' },
          description: 'Long description',
          times_bought: '20'
        }
      ).valid?
    )
  end

  def test_invalid_schema_field
    assert_equal(
      SchemaCompliance::Result.new(false, []).valid?,
      @schema.validate(
        {
          name: 'Amazing product!',
          tax: { value: '10', currency: 'USD' },
          price: { value: 100, currency: 'USD' },
          description: 'Long description',
          times_bought: 20
        }
      ).valid?
    )
  end

  def test_invalid_schema_field
    assert_equal(
      SchemaCompliance::Result.new(false, []).valid?,
      @schema.validate(
        {
          name: 'Amazing product!',
          tax: { value: '10', currency: 'USD' },
          price: { value: 100, currency: 'USD' },
          description: 'Long description',
          times_bought: 20
        }
      ).valid?
    )
  end
end
