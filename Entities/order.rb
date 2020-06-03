# frozen_string_literal: true

require 'date'
# Order Class
class Order
  attr_reader :reader
  attr_reader :book
  attr_reader :date

  def initialize(reader, book, date = Date.today)
    @reader = reader
    @book = book
    @date = date
  end
end
