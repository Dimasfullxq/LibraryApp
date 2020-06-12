# frozen_string_literal: true

# Order Class
class Order
  include Validate
  attr_reader :reader
  attr_reader :book
  attr_reader :date

  def initialize(reader:, book:, date: Date.today)
    validate(reader: reader, book: book)
    @reader = reader
    @book = book
    @date = date
  end

  private

  def validate(reader:, book:, reader_class: Reader, book_class: Book)
    validate_class(reader, reader_class)
    validate_class(book, book_class)
  end
end
