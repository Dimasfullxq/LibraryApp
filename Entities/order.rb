# frozen_string_literal: true

# Order Class
class Order
  include Validate
  attr_reader :reader
  attr_reader :book
  attr_reader :date

  def initialize(reader:, book:, date: Date.today)
    @reader = reader if valid(reader, 'Reader')
    @book = book if valid(book, 'Book')
    @date = date
  end
end
