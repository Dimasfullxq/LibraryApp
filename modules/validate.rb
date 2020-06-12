# frozen_string_literal: true

# module for entities and fields validating
module Validate
  def validate_string(*fields)
    fields.each { |field| raise Errors::EmptyStringError if field.empty? }
  end

  def validate_integer(*fields)
    fields.each { |field| raise Errors::NegativeIntegerError if field.negative? }
  end

  def validate_class(*fields, field_class)
    fields.each do |field|
      message = "Expected #{field_class} class!, current: #{field.class}"
      class_validation = Errors::ClassError.new(message)
      raise class_validation unless field.is_a?(field_class)
    end
  end
end
