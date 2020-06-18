# frozen_string_literal: true

# erors module
module Errors
  # ClassError class
  class ClassError < StandardError
    def initialize(message)
      super(message)
    end
  end

  # EmptyStringError class
  class EmptyStringError < StandardError
    def initialize(message = 'String can not be empty')
      super(message)
    end
  end

  # NegativeIntegerError class
  class NegativeIntegerError < StandardError
    def initialize(message = 'Number can not be negative')
      super(message)
    end
  end

  # WrongAddingType class
  class WrongTypeAdded < StandardError
    def initialize(message = 'Wrong type added to library. It must be only Author, Reader, Book, Order')
      super(message)
    end
  end
end
