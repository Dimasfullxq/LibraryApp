# frozen_string_literal: true

require 'yaml'
# Library Class
class Library
  attr_reader :authors
  attr_reader :orders
  attr_reader :readers_with_orders

  def initialize
    @authors = []
    @orders = []
    @readers_with_orders = []
  end

  def add_order(orders)
    orders.each do |order|
      @orders.push(order)
      readers_with_books = {
        reader: order.reader,
        book: order.book
      }
      @readers_with_orders.push(readers_with_books)
    end
  end

  def top_reader(num = 1)
    top_readers = []
    readers = []
    top_entity(num, top_readers, readers, :reader)
  end

  def most_popular_books(num = 1)
    top_books = []
    books = []
    top_entity(num, top_books, books, :book)
  end

  def number_of_readers_of_the_most_popular_books(num = 3)
    readers = []
    books = []
    top_books = most_popular_books(num)
    @readers_with_orders.uniq.each { |book| books.push(book) }
    top_books.each do |book|
      readers += books.select { |b| b[:book] == book }
    end
    readers.uniq { |reader| reader[:reader] }.size
  end

  def save(authors, readers, books, orders)
    data = { authors: authors, readers: readers, books: books, orders: orders }
    file = File.open('data.yml', 'w')
    file.write(data.to_yaml)
    puts 'Data saved in file'
    file.close
    puts 'File after writing is closed' if file.closed?
  end

  def load
    YAML.load_file('data.yml')
  ensure
    puts 'Data has been loaded from file'
  end

  private

  def top_entity(num, top_entities, entities, entity_name)
    @readers_with_orders.uniq.each { |entity| entities.push(entity[entity_name]) }
    while num.positive?
      top_entity_var = entities.max_by { |entity| entities.count(entity) }
      top_entities.push(top_entity_var)
      entities.delete(top_entity_var)
      num -= 1
    end
    top_entities
  end
end
