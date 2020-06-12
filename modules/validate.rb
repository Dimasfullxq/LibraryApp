# frozen_string_literal: true

# module for entities and fields validating
module Validate
  VALIDATE_CLASSES = %w[Author Book Reader].freeze
  # custom validate class
  class CustomValidate < StandardError
    def initialize(message = 'This is a custom exception')
      super(message)
    end
  end

  def valid(field, field_type)
    case field_type
    when 'String' then validate_string(field)
    when 'Integer' then validate_integer(field)
    else validate_class(field, field_type)
    end
  end

  private

  def validate_string(field)
    string_size_validate = CustomValidate.new('String can not be empty!')
    string_class_validate = CustomValidate.new('It is not a string')
    raise string_class_validate if field.class != String
    raise string_size_validate if field.empty? || field.start_with?(' ')

    true
  end

  def validate_integer(field)
    integer_negative_validate = CustomValidate.new('Number can not be negative')
    integer_class_validate = CustomValidate.new('It is not an integer!')
    raise integer_class_validate if field.class != Integer
    raise integer_negative_validate if field.negative?

    true
  end

  def validate_class(field, field_type)
    field_class = field.class.to_s
    message = "Expected #{field_type} class!, current: #{field.class}"
    class_validation = CustomValidate.new(message)
    raise class_validation unless VALIDATE_CLASSES.include?(field_class)

    true
  end
end
