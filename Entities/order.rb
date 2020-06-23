# frozen_string_literal: true

# Order Class
class Order
  include Validate
  attr_reader :reader, :book, :date

  def initialize(reader:, book:, date: Date.today)
    validate(reader, book)
    @reader = reader
    @book = book
    @date = date
  end

  private

  def validate(reader, book)
    validate_class(reader, Reader)
    validate_class(book, Book)
  end
end
